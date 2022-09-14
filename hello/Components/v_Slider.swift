//
//  v_Slider.swift
//  format
//
//  Created by 1 on 7/28/22.
//

import SwiftUI

struct v_Slider: View {
    @State private var speed1: Float = 60.0
    @State private var speed2: Float = 30.0
    
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack {
            Section(header: Text("Slider 默认风格")) {
                DefaultSilder(speed: $speed1, isEditingStatus: $isEditing)
                
                Text("\(speed1, specifier: "%.2f")")
                        .foregroundColor(isEditing ? .red : .blue)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 100, trailing: 0))
            }
            
            Section(header: Text("Slider 自定义风格")) {
                CustomSlider(percentage: $speed2)
                    .frame(height: 20)
                
                Text("\(speed2, specifier: "%.2f")")
                        .foregroundColor(isEditing ? .red : .blue)
            }
        }
        .padding()
        .navigationBarTitle("Slider")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Slider"))
    }
}

struct DefaultSilder: View {
    @Binding var speed: Float
    @Binding var isEditingStatus: Bool
    
    var body: some View {
        Slider(
            value: $speed,
            in: 0...100,
            step: 1
        ) {
            Text("Slider")
        } minimumValueLabel: {
            Text("0")
        } maximumValueLabel: {
            Text("100")
        } onEditingChanged: { editing in
            isEditingStatus = editing
        }
    }
}


struct CustomSlider: View {
    @Binding var percentage: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.gray)
                Rectangle()
                    .foregroundColor(.accentColor)
                    .frame(width: geometry.size.width * CGFloat(self.percentage / 100))
            }
            .cornerRadius(12)
            .gesture(DragGesture(minimumDistance: 0).onChanged({ value in
                self.percentage = min(max(0, Float(value.location.x / geometry.size.width * 100)), 100)
            }))
        }
    }
}


struct v_Slider_Previews: PreviewProvider {
    static var previews: some View {
        v_Slider()
    }
}
