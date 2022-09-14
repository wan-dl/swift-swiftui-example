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

struct Step: Identifiable {
    let id = UUID()
    let count: Int
    let date: Date
}

// 格式化日期：日期转字符串
func getCurrentDateTime(format: String) -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "zh_CN")
    formatter.dateFormat = format
    let datetime = formatter.string(from: Date())
    return datetime
}

class HealthStore {
    
    var healthStore: HKHealthStore?
    var query: HKStatisticsCollectionQuery?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
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
        
        let authResult = getHealthAuthorizationStatus(workoutType)
        print("::应用授权状态 -> \(authResult)")
//        if !authResult { return completion(false) }
        
        // 获取运行步数
        let HK_stepCount = HKObjectType.quantityType(forIdentifier: .stepCount)
        
        let readingTypes = Set([HK_stepCount!, workoutType])
        let writingTypes = Set([HK_stepCount!, workoutType])
        
        // 设定要获取healthkit中的数据样本
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        
        guard let healthStore = self.healthStore else { return completion(false) }
        
        healthStore.requestAuthorization(toShare: [], read: readingTypes ) { (success, error) in
            if error != nil {
                print("::requestAuthorization error -> \(String(describing: error))")
            } else {
                print("::requestAuthorization result -> \(success)")
            }
            completion(success)
        }
    }
}

struct api_HealthKit: View {
    private var healthStore: HealthStore?
    
    @State private var steps: [Step] = [Step]()
    @State private var lastDayData: Int = 0
    
    @State private var isPresented: Bool = false
    
    init() {
        healthStore = HealthStore()
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
                Label("获取运动健康数据", systemImage: "figure.run")
            })
            .buttonStyle(PrimaryBtnStyle())
            .alert("未获取到运行数据权限", isPresented: $isPresented) {
                Button("关闭") {}
                Button("去设置") {}
            }
        }
        .padding()
        .navigationTitle("HealthKit - 健康")
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
                    isPresented.toggle()
                }
            }
        }
    }
    
    private func updateUIFromStatistics(statisticsCollection: HKStatisticsCollection) {
        
        var startDate = Calendar.current.date(byAdding: .hour, value: -1, to: Date())!
        let endDate = Date()
        print("查询日期: \(startDate) \(endDate)")
        
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            let step = Step(count: Int(count ?? 0), date: statistics.startDate)
            steps.append(step)
        }
        // 获取最后1几天数据用于填充UI
        if !steps.isEmpty {
            do {
                try lastDayData = steps[steps.endIndex - 1].count
            } catch {}
        }
    }
}

struct api_HealthKit_Previews: PreviewProvider {
    static var previews: some View {
        api_HealthKit()
    }
}
