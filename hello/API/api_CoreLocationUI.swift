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

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 42.0422448, longitude: -102.0079053),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestLocation() {
        locationManager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        guard let location = locations.first else { return }
        
        DispatchQueue.main.async {
            self.location = location.coordinate
            self.region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
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

                    Spacer()
                    LocationButton {
                        locationManager.requestLocation()
                    }
                    .frame(width: 200, height: 40)
                    .cornerRadius(30)
                    .symbolVariant(.fill)
                    .foregroundColor(.white)
                }
                .padding()
            }
            .navigationTitle("CoreLocationUI")
        }
}

struct api_CoreLocationUI_Previews: PreviewProvider {
    static var previews: some View {
        api_CoreLocationUI()
    }
}
