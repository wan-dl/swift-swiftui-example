//
//  PagesMaps.swift
//  format
//
//  Created by 1 on 7/29/22.
//

import SwiftUI
import MapKit

struct v_Maps: View {
    @State var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2DMake(37.8, 117.5),
        latitudinalMeters: 5000,
        longitudinalMeters: 5000
    )
    
    var body: some View {
        VStack {
            Text("地图控件")
                .font(.title)
            
            Map(coordinateRegion: $region)
                .frame(height: 300)
        }
        .navigationBarTitle("Map")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Map"))
    }
}

struct v_Maps_Previews: PreviewProvider {
    static var previews: some View {
        v_Maps()
    }
}
