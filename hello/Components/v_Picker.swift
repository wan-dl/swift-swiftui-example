//
//  ViewPicker.swift
//  format
//
//  Created by 1 on 7/28/22.
//

import SwiftUI

struct v_Picker: View {
    
    var body: some View {
        VStack {
            List {
                
                Section("Picker样式") {
                    NavigationLink("默认样式", destination: v_pickerStyle_default())
                    NavigationLink("menu样式", destination: v_pickerStyle_menu())
                    NavigationLink("segmented样式", destination: v_pickerStyle_segmented())
                    NavigationLink("wheel样式", destination: v_pickerStyle_wheel())
                    NavigationLink("inline样式", destination: v_pickerStyle_inline())
                }
                
                Section(header: Text("多列选择器")) {
                    NavigationLink("选择省市", destination: v_MultiPicker())
                }
                
                Section(header: Text("ColorPicker").textCase(.none)) {
                    NavigationLink("颜色选择器", destination: v_ColorPicker())
                }
                
                Section(header: Text("DatePicker").textCase(.none)) {
                    NavigationLink("日期选择器", destination: v_DatePicker())
                }
            }
        }
        .navigationTitle("Picker")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct v_Picker_Previews: PreviewProvider {
    static var previews: some View {
        v_Picker()
    }
}
