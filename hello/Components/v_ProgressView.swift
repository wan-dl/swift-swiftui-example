//
//  ViewProgressView.swift
//  format
//
//  Created by 1 on 7/29/22.
//

import SwiftUI

struct v_ProgressView: View {
    @State private var progress = 0.5
    
    var body: some View {
        VStack(spacing: 30) {
            Section() {
                Text("进度条样式")
                    .font(.title3)
                
                ProgressView(value: progress)
                
                Button("More", action: { progress += 0.05 })
                    .padding()
            }
            
            Divider()
            
            Section() {
                Text("loading样式")
                    .font(.title3)
                
                ProgressView(value: progress)
                    .progressViewStyle(.circular)
            }
        }
        .padding()
        .navigationBarTitle(Text("ProgressView"), displayMode: .inline)
    }
}

struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0, blue: 0.6),
                    radius: 4.0, x: 1.0, y: 2.0)
    }
}

struct v_ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        v_ProgressView()
    }
}
