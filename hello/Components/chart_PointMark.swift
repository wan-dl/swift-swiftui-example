//
//  chart_PointMark.swift
//  HelloSwift
//
//  Created by 1 on 8/1/22.
//

import Charts
import SwiftUI

struct SalaryItem: Identifiable {
    let Mon: String
    let value: Float
    
    var id:String { Mon }
}

let Salarys: [SalaryItem] = [
    .init(Mon: "1月", value: 800.0),
    .init(Mon: "1月", value: 850.1),
    .init(Mon: "3月", value: 880.0),
    .init(Mon: "4月", value: 985.8),
    .init(Mon: "5月", value: 1200.0),
    .init(Mon: "6月", value: 1205.0),
    .init(Mon: "7月", value: 1100.0)
]

struct chart_PointMark: View {
    var body: some View {
        VStack {
            if #available(iOS 16.0, *) {
                showPointMark
            } else {
                Text("Chart仅支持iOS 16.0")
                    .font(.body)
            }
        }
        .navigationBarTitle("点图", displayMode: .inline)
    }
    
    @available(iOS 16.0, *)
    var showPointMark: some View {
        GroupBox(label: Text("每月淘宝收入").padding(.vertical, 20)) {
            Chart(Salarys) {
                PointMark(
                    x: .value("Mon", $0.Mon),
                    y: .value("value", $0.value)
                )
            }
            .frame(height: 250)
            .padding()
        }
    }
}

struct chart_PointMark_Previews: PreviewProvider {
    static var previews: some View {
        chart_PointMark()
    }
}
