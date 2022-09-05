//
//  v_DatePicker.swift
//  HelloSwift
//
//  Created by 1 on 9/5/22.
//

import SwiftUI

struct v_DatePicker: View {
    @State private var date = Date()
    
    // 格式化日期
    static let dateFormatter: DateFormatter = {
        let formmatter = DateFormatter()
        formmatter.dateFormat = "YYYY-MM-dd"
        return formmatter
    }()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("当前日期").textCase(.none)) {
                    DatePicker(
                        "当前日期",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                }
                
                Section(header: Text("当前日期").textCase(.none)) {
                    DatePicker(
                        "当前时间",
                        selection: $date,
                        displayedComponents: [.hourAndMinute]
                    )
                }
                
                Section() {
                    Text("格式化日期: \(date, formatter: Self.dateFormatter)")
                }
                
                DatePicker(
                    "开始日期",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
            }
        }
        .navigationTitle("DatePicker")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct v_DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        v_DatePicker()
    }
}
