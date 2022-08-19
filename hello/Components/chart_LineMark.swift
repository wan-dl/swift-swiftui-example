//
//  chart_LineMark.swift
//  HelloSwift
//
//  Created by 1 on 8/1/22.
//

#if canImport(Charts)
import Charts
#endif
import SwiftUI

struct WorkItem: Identifiable {
    let name: String
    let theWeek: String
    let value: Float
    
    var id:String { name }
}

let Works: [WorkItem] = [
    .init(name: "小明", theWeek: "周一", value: 8.0),
    .init(name: "小明", theWeek: "周二", value: 8.1),
    .init(name: "小明", theWeek: "周三", value: 9.0),
    .init(name: "小明", theWeek: "周四", value: 8.8),
    .init(name: "小明", theWeek: "周五", value: 12.0),
    .init(name: "小红", theWeek: "周一", value: 9.0),
    .init(name: "小红", theWeek: "周二", value: 10.1),
    .init(name: "小红", theWeek: "周三", value: 3.0),
    .init(name: "小红", theWeek: "周四", value: 6.8),
    .init(name: "小红", theWeek: "周五", value: 13.0)
]

struct chart_LineMark: View {
    var body: some View {
        VStack {
            if #available(iOS 16.0, *) {
                showLinkMark
            } else {
                Text("Chart仅支持iOS 16.0")
                    .font(.body)
            }
        }
        .navigationBarTitle("线图", displayMode: .inline)
    }
    
    @available(iOS 16.0, *)
    var showLinkMark: some View {
        GroupBox(label: Text("每天工作时间").padding(.vertical, 20)) {
            Chart(Works) {
                LineMark(
                    x: .value("theWeek", $0.theWeek),
                    y: .value("value", $0.value),
                    series: .value("name", $0.name)
                )
                .foregroundStyle(by: .value("name", $0.name))
                .symbol(by: .value("name", $0.name))
                //                .interpolationMethod(.catmullRom)
                //                .position(by: .value("theWeek", $0.theWeek))
            }
            .chartYScale(domain: 0 ... 20)
            .chartForegroundStyleScale([
                "小明": .orange,
                "小红": .pink
            ])
            .frame(height: 250)
            .padding()
        }
    }
}

struct chart_LineMark_Previews: PreviewProvider {
    static var previews: some View {
        chart_LineMark()
    }
}
