//
//  chart_BarMark.swift
//  HelloSwift
//
//  Created by 1 on 8/1/22.
//

#if canImport(Charts)
import Charts
#endif
import SwiftUI

struct PrecipitationItem: Identifiable {
    let name: String
    let value: Float
    
    var id:String { name }
}

let Precipitations: [PrecipitationItem] = [
    .init(name: "北京", value: 407.95),
    .init(name: "天津", value: 556.41),
    .init(name: "山西", value: 2271.63),
    .init(name: "河北", value: 1542.38),
    .init(name: "山东", value: 1171.20)
]

struct chart_BarMark: View {
    @State var isSwitch: Bool = true
    
    var body: some View {
        
        GroupBox(label: Text("中国华北地区降水量").padding(.vertical, 20)) {
            
            if #available(iOS 16.0, *) {
                if isSwitch {
                    verticalBar
                } else {
                    horizontallBar
                }
                
                Button("切换柱状图方向", action: {
                    self.isSwitch.toggle()
                })
                .offset(y: 45)
                .foregroundStyle(.black)
            } else {
                Text("图表仅支持iOS 16.0系统")
            }
        }
        .navigationBarTitle("BarMark - 柱状图")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "BarMark"))
    }
    
    @available(iOS 16.0, *)
    var verticalBar: some View {
        Chart(Precipitations) { elem in
            BarMark(
                x: .value("name", elem.name),
                y: .value("value", elem.value),
                width: .ratio(0.5)
            )
            .foregroundStyle(.blue.opacity(0.6))
            .accessibilityLabel(elem.name)
            .accessibilityValue("\(elem.value)")
        }
        .frame(height: 250)
    }
    
    @available(iOS 16.0, *)
    var horizontallBar: some View {
        Chart(Precipitations) { elem in
            BarMark(
                x: .value("value", elem.value),
                y: .value("name", elem.name)
            )
            .foregroundStyle(.blue.opacity(0.6))
        }
        .frame(height: 250)
    }
}

struct chart_BarMark_Previews: PreviewProvider {
    static var previews: some View {
        chart_BarMark()
    }
}
