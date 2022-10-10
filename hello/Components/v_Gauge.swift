//
//  v_Gauge.swift
//  Hello
//
//  Created by 1 on 10/10/22.
//

import SwiftUI

struct v_Gauge: View {
    @State private var gradeValue = 0.65
    
    @State private var current = 37.0
    @State private var minValue = 0.0
    @State private var maxValue = 100.0
    
    let gradient = Gradient(colors: [.green, .yellow, .orange, .red])
    
    var body: some View {
        VStack(spacing: 50) {
            if #available(iOS 16.0, *) {
                List {
                    
                    Section("默认常规用法") {
                        example1
                    }
                    
                    Section("渐变效果") {
                        example1
                            .tint(gradient)
                    }
                    
                    Section(header: Text("Gauge: 显示最大值、最小值、当前值，并改变颜色").textCase(.none)) {
                        example2
                    }
                    
                    Section(header: Text("Gauge: .gaugeStyle(.accessoryLinearCapacity)").textCase(.none)) {
                        example3
                            .gaugeStyle(.accessoryLinearCapacity)
                    }
                    
                    Section(header: Text("Gauge: .gaugeStyle(.linearCapacity)").textCase(.none)) {
                        example3
                            .gaugeStyle(.linearCapacity)
                    }
                    
                    Section(header: Text("Gauge: .gaugeStyle(.accessoryLinear)").textCase(.none)) {
                        example3
                            .gaugeStyle(.accessoryLinear)
                    }
                    
                    Section(header: Text("Gauge: .gaugeStyle(.accessoryCircularCapacity)").textCase(.none)) {
                        example3
                            .gaugeStyle(.accessoryCircularCapacity)
                    }
                    
                    Section(header: Text("Gauge: .gaugeStyle(.accessoryCircular)").textCase(.none)) {
                        example3
                            .gaugeStyle(.accessoryCircular)
                    }
                    
                    Section(header: Text("Gauge: .accessoryCircular 渐变效果 + 颜色设置").textCase(.none)) {
                        example4
                    }
                }
            }
        }
        .navigationTitle("Gauge")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Gauge"))
    }
    
    @available(iOS 16.0, *)
    var example1: some View {
        Gauge(value: gradeValue) {
            Text("Grade Value")
        }
        .frame(height: 100, alignment: .center)
    }
    
    @available(iOS 16.0, *)
    var example2: some View {
        Gauge(value: current, in: minValue...maxValue) {
            Text("速度")
        } currentValueLabel: {
            Text("\(Int(current))")
        } minimumValueLabel: {
            Text("\(Int(minValue))")
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
        }
        .gaugeStyle(.automatic)
        .tint(.pink)
        .foregroundColor(.pink)
        .frame(height: 100)
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    @available(iOS 16.0, *)
    var example3: some View {
        Gauge(value: current, in: minValue...maxValue) {
            Text("速度")
        } currentValueLabel: {
            Text("\(Int(current))")
        } minimumValueLabel: {
            Text("\(Int(minValue))")
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    @available(iOS 16.0, *)
    var example4: some View {
        Gauge(value: current, in: minValue...maxValue) {
            Text("速度")
        } currentValueLabel: {
            Text("\(Int(current))")
                .foregroundColor(Color.green)
        } minimumValueLabel: {
            Text("\(Int(minValue))")
                .foregroundColor(Color.green)
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
                .foregroundColor(Color.red)
        }
        .gaugeStyle(.accessoryCircular)
        .tint(gradient)
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(height: 100)
    }
}

struct v_Gauge_Previews: PreviewProvider {
    static var previews: some View {
        v_Gauge()
    }
}
