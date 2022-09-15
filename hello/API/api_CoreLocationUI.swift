//
//  api_CoreLocationUI.swift
//  HelloSwift
//
//  Created by 1 on 8/8/22.
//

import SwiftUI
import CoreLocation
import CoreLocationUI
import MapKit

// 地图显示，默认经纬度
private struct testRegion {
    static let latitude = 30.259324
    static let longitude = 120.130203
}

private struct Span {
    static let delta = 0.1
}

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    
    @Published var region: MKCoordinateRegion = .init(
        center: CLLocationCoordinate2D(latitude: testRegion.latitude, longitude: 120.130203),
        span: MKCoordinateSpan(latitudeDelta: Span.delta, longitudeDelta: Span.delta)
    )

    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }

    func requestLocation() {
        locationManager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        print("Location :: \(location)")
        
        DispatchQueue.main.async {
            self.location = location.coordinate
            self.region = .init(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            )
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

@available (iOS 15.0, *)
struct api_CoreLocationUI: View {
    @StateObject var locationManager = LocationManager()

    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                if let location = locationManager.location {
                    Text("当前经纬度: \(location.latitude), \(location.longitude)")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding()
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                LocationButton(.currentLocation) {
                    locationManager.requestLocation()
                }
                .symbolVariant(.fill)
                .labelStyle(.titleAndIcon)
                .foregroundColor(.white)
            }
            .padding()
        }
        .navigationTitle("CoreLocationUI")
        .modifier(navBarViewCodeAndDocs(pageType: "API",pageID: "CoreLocationUI"))
    }
}

struct api_CoreLocationUI_Previews: PreviewProvider {
    static var previews: some View {
        api_CoreLocationUI()
    }
}
