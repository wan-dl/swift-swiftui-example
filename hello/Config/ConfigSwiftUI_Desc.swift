//
//  ConfigSwiftUI_Desc.swift
//  HelloSwift
//
//  Created by 1 on 9/10/22.
//

import SwiftUI

// sheet
let ui_sheet_available_versions = "iOS 13.0+"
let ui_sheet_desc:String = ".sheet() 方法，用于在页面底部显示工作表。iOS 16.0+，增加 .presentationDetents() 修饰符，可以控制sheet大小。语法如下: "
let ui_sheet_declaration:String = """
func sheet<Content>(
    isPresented: Binding<Bool>,
    onDismiss: (() -> Void)? = nil,
    content: @escaping () -> Content
) -> some View where Content : View
"""
