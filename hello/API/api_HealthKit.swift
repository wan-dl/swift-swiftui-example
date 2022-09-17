//
//  api_HealthKit.swift
//  HelloSwift
//
//  Created by 1 on 8/8/22.
//

import SwiftUI
import HealthKit
import HealthKitUI
import CoreMotion


struct Step: Identifiable {
    let id = UUID()
    let count: Int
    let date: Date
}

struct api_HealthKit: View {
    private var healthStore: HealthStoreUsage?
    
    @State private var steps: [Step] = [Step]()
    @State private var lastDayData: Int = 0
    
    @State private var isPresented: Bool = false
    
    init() {
        healthStore = HealthStoreUsage()
    }
    
    var body: some View {
        VStack {
            Circle()
                .fill(.green.opacity(0.6))
                .frame(width: 180, height: 180)
                .overlay(
                    Label("\(lastDayData)", systemImage: "figure.walk")
                        .foregroundColor(.white).font(.title)
                )
                .offset(y: -30)
            
            Button(action: {
                getHealthData()
            }, label: {
                Label("从 健康应用 中获取步数", systemImage: "figure.run")
            })
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            .alert("未获取到【健康】数据权限", isPresented: $isPresented) {
                Button("关闭") {}
                Button("去设置") {
                    openIphoneHealthSetting()
                }
            }
        }
        .navigationTitle("HealthKit - 健康")
        .modifier(navBarViewCodeAndDocs(pageType: "API",pageID: "HealthKit"))
    }
    
    func getHealthData() {
        if let healthStore = healthStore {
            healthStore.requestAuthorization{ success in
                if success {
                    healthStore.calculateSteps { statisticsCollection in
                        if let statisticsCollection = statisticsCollection {
                            updateUIFromStatistics(statisticsCollection: statisticsCollection)
                        }
                    }
                } else {
                    self.isPresented.toggle()
                }
            }
        }
    }
    
    // 打开手机系统设置
    func openIphoneHealthSetting() {
        if #available(iOS 10, *) {
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        } else {
            if let appSettings = NSURL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.openURL(appSettings as URL)
            }
        }
    }
    
    func updateUIFromStatistics(statisticsCollection: HKStatisticsCollection) {
        
        var startDate = Calendar.current.date(byAdding: .hour, value: -1, to: Date())!
        let endDate = Date()
        
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            let step = Step(count: Int(count ?? 0), date: statistics.startDate)
            steps.append(step)
        }
        // 获取最后1天数据用于填充UI
        if !steps.isEmpty {
            lastDayData = steps[steps.endIndex - 1].count
        }
    }
}

extension Date {
    static func mondayAt12AM() -> Date {
        return Calendar(identifier: .iso8601).date(from: Calendar(identifier:
                .iso8601).dateComponents([.yearForWeekOfYear,.weekOfYear], from: Date()))!
    }
    
    static func dateFromGMT(_ date: Date) -> Date {
        let secondFromGMT: TimeInterval = TimeInterval(TimeZone.current.secondsFromGMT(for: date))
        return date.addingTimeInterval(secondFromGMT)
    }
}

class HealthStoreUsage {
    
    var healthStore: HKHealthStore?
    var query: HKStatisticsCollectionQuery?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
    // 获取应用程序授权状态
    func getHealthAuthorizationStatus(_ NSObject: HKObjectType) -> Bool{
        let authorizationStatus = healthStore?.authorizationStatus(for: NSObject)
        var result: Bool = false
        switch authorizationStatus {
        case .notDetermined:
            // 用户尚未选择授权访问指定的数据类型。
            result = false
        case .sharingAuthorized:
            // 用户已明确授权您的应用保存指定类型的数据。
            result = true
        case .sharingDenied:
            // 用户已明确拒绝您的应用保存指定类型数据的权限。
            result = false
        default:
            result = false
        }
        return result
    }
    
    // 请求保存和读取，健康数据类型的权限
    func requestAuthorization(completion: @escaping(Bool) -> Void) {
        
        let workoutType = HKObjectType.workoutType()
        
//        let authResult = getHealthAuthorizationStatus(workoutType)
//        print("::应用授权状态 -> \(authResult)")
        
        // 获取运行步数
        let readTypes = Set([
            HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount )!
        ])
        
        // 设定要获取healthkit中的数据样本
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        
        guard let healthStore = self.healthStore else { return completion(false) }
        
        healthStore.requestAuthorization(toShare: [], read: readTypes ) { (success, error) in
            if error != nil {
                print("::requestAuthorization error -> \(String(describing: error))")
            } else {
                print("::requestAuthorization result -> \(success)")
            }
            return completion(success)
        }
    }
    
    // 按日期查询
    func calculateSteps(completion: @escaping (HKStatisticsCollection?) -> Void) {
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())
        let anchorDate = Date.mondayAt12AM()
        let daily = DateComponents(day: 1)
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
        
        // 构建查询条件
        query = HKStatisticsCollectionQuery(
            quantityType: stepType,
            quantitySamplePredicate: predicate,
            options: .cumulativeSum,
            anchorDate: anchorDate,
            intervalComponents: daily
        )
        
        query!.initialResultsHandler = { query, statisticsCollection, error in
            completion(statisticsCollection)
        }
        
        if let headlthStore = healthStore, let query = self.query {
            headlthStore.execute(query)
        }
    }
}


struct api_HealthKit_Previews: PreviewProvider {
    static var previews: some View {
        api_HealthKit()
    }
}
