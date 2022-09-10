//
//  ConfigSwiftUI_Desc.swift
//  HelloSwift
//
//  Created by 1 on 9/10/22.
//

import SwiftUI

// sheet
let ui_sheet_available_versions: [String] = ["iOS 13.0+"]
let ui_sheet_desc:String = ".sheet() 方法，用于在页面底部显示工作表。iOS 16.0+，增加 .presentationDetents() 修饰符，可以控制sheet大小。语法如下: "
let ui_sheet_declaration:String = """
func sheet<Content>(
    isPresented: Binding<Bool>,
    onDismiss: (() -> Void)? = nil,
    content: @escaping () -> Content
) -> some View where Content : View
"""

// Form
let ui_form_available_versions: [String] = ["iOS 13.0+", "macOS 10.15+"]
let ui_form_desc: String = "Form, 将适合表单的样式视图组合到一起，如按钮、列表、Pikcer、Toggle等"
let ui_form_declaration:String = """
struct Form<Content> where Content : View
"""
