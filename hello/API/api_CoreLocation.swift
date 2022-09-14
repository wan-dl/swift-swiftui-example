//
//  api_CoreLocation.swift
//  HelloSwift
//
//  Created by 1 on 8/8/22.
//

// 感谢：https://juejin.cn/post/7002433492562739207

import SwiftUI
import CoreLocation

class LocationModel: NSObject {

    @objc var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
    @objc var adcode: String?
    @objc var citycode: String?
    @objc var country: String?
    @objc var city: String?
    @objc var area: String?
    @objc var province: String?
    @objc var address: String?
    @objc var street: String?
}


class EPLocationManager: NSObject {
    
    @objc public static let manager: EPLocationManager = { EPLocationManager() }()
    
    private lazy var locationManager = CLLocationManager()
    private var locationCompletionBlock: ((LocationModel) -> ())?
    @objc public var userLocationModel: LocationModel? // 用户定位信息的模型
    private var isAloneLocaion: Bool=false


    private override init() {
        super.init()
        configLocationManager()
    }

    deinit {
        locationManager.delegate = nil
    }

    private func configLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.requestWhenInUseAuthorization()
    }

     /// 停止定位
    func stopLocation() {
        locationManager.stopUpdatingLocation()
    }

     /// 单次定位
    @objc func aloneReGeocodeLocation(_ completionBlock: ((LocationModel) -> ())?=nil) {
        isAloneLocaion = true
        serialReGeocodeLocation(completionBlock)
    }

    /// 连续定位 记得在不用的时候调用 stopLocation
    func serialReGeocodeLocation(_ completionBlock: ((LocationModel) -> ())?=nil) {
        self.locationCompletionBlock = completionBlock
        locationManager.stopUpdatingLocation()
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
    }
}


extension EPLocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        for location in locations {
            if location.coordinate.latitude > 0 && location.coordinate.longitude > 0 {
                if isAloneLocaion {
                    stopLocation()
                }
            }
            
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { (placemarksArray, error) in
                if error != nil {
                    print("geocoder fail \(error!.localizedDescription)")
                }
                guard let placemarks = placemarksArray else { return }
               
                if placemarks.count > 0 {
                    let placemark = placemarks[0]
                    
                    let model = LocationModel()
                    model.coordinate = location.coordinate
                    
                    model.city = placemark.locality ?? ""
                    model.province = placemark.administrativeArea ?? ""
                    model.area = placemark.subLocality ?? ""
                    model.address = placemark.name ?? ""
                    model.street = placemark.thoroughfare ?? ""

                    self.userLocationModel = model
                    self.locationCompletionBlock?(model)
                }
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location is fail \(error.localizedDescription)")
    }

}

// 检查定位权限
func checkLocationPermission() -> Bool {
    let authStatus = CLLocationManager.authorizationStatus()
    return authStatus != .restricted && authStatus != .denied
}


struct api_CoreLocation: View {
    @State var LocationPermissionNoteEnabled: Bool = false
    
    @State var LocationCity: String = ""
    @State var LocationArea: String = ""
    @State var address: String = ""
    @State var street: String = ""
    @State var LatitudeLongitude = LocationModel().coordinate
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("当前城市: \(LocationCity)")
                    .font(.body)
                Text("当前地区: \(LocationArea)")
                    .font(.body)
                Text("当前街道: \(street)")
                    .font(.body)
                Text("经纬度: \(LatitudeLongitude.latitude) \(LatitudeLongitude.longitude)")
                    .font(.body)
            }
            .offset(y: -30)
            
            Button(action: {
                let checkResult = checkLocationPermission()
                if checkResult {
                    EPLocationManager.manager.aloneReGeocodeLocation { (model) in
                        LocationArea = model.area ?? ""
                        LocationCity = model.city ?? ""
                        LatitudeLongitude = model.coordinate
                        address = model.address ?? ""
                        street = model.street ?? ""
                    }
                } else {
                    self.LocationPermissionNoteEnabled.toggle()
                }
            }, label: {
                Label("获取定位", systemImage: "location.fill")
            })
            .buttonStyle(PrimaryBtnStyle())
            .alert("定位权限未开启", isPresented: $LocationPermissionNoteEnabled) {
                Button("我知道了") {}
                Button("前往设置") {
                    openOSSetting()
                }
            }
            
            Button(action: {
                EPLocationManager.manager.stopLocation()
            }, label: {
                Label("停止定位", systemImage: "stop.circle")
            })
            .buttonStyle(PrimaryBtnStyle())
            
        }
        .padding()
        .navigationTitle("Core Location")
    }
}

struct api_CoreLocation_Previews: PreviewProvider {
    static var previews: some View {
        api_CoreLocation()
    }
}
