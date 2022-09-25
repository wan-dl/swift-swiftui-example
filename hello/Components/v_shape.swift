//
//  v_shape.swift
//  HelloSwift
//
//  Created by 1 on 7/31/22.
//

import SwiftUI

struct v_shape: View {
    var body: some View {
        List {
            Section() {
                NavigationLink("Circle() - 圆形|环形", destination: v_Circle())
                NavigationLink("Circle() - 圆形进度条", destination: v_CircleProgressBar())
            }
            
            Section() {
                NavigationLink("Rectangle()", destination: v_Rectangle())
                NavigationLink("RoundedRectangle()", destination: v_RoundedRectangle())
            }
            
            Section() {
                NavigationLink("Ellipse()", destination: v_Ellipse())
            }
            
            Section() {
                NavigationLink("Capsule() - 胶囊", destination: v_Capsule())
                NavigationLink("Capsule() 组合", destination: v_CapsuleGroup())
            }
            
            Section() {
                NavigationLink("Path()", destination: v_Path())
            }
        }
        .navigationTitle("Shapes")
    }
}

struct v_shape_Previews: PreviewProvider {
    static var previews: some View {
        v_shape()
    }
}
