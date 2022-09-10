//
//  Config.swift
//  HelloSwift
//
//  Created by hx on 9/9/22.
//

import Foundation
import SwiftUI

struct LangSwiftUIItem: Identifiable {
    let id = UUID()
    var name: String
    var searchKeyword: String
    var viewname: AnyView
}

struct CInfo: Identifiable {
    let id: UUID = UUID()
    var name: String
    var seas: [LangSwiftUIItem]
}

let SwiftUIComponentsList: [CInfo] = [
    CInfo(
        name: "Text Input and Output",
        seas: [
            LangSwiftUIItem(name: "Text - 文本", searchKeyword: ".font字体,.fontWeight字重,.foregoundColor前景色,.italic斜体,.bold粗体,.underline下划线,.textCase大小写,.strikethrough删除线, .linelimit超出截断,.background背景色,.linespacing行间距,.textselection选中", viewname: AnyView(v_Text())),
            LangSwiftUIItem(name: "Label", searchKeyword: "", viewname: AnyView(v_Label())),
            LangSwiftUIItem(name: "TextField - 文本输入框", searchKeyword: "", viewname: AnyView(v_TextField())),
            LangSwiftUIItem(name: "TextEditor - 多行文本框", searchKeyword: "", viewname: AnyView(v_TextEditor())),
        ]
    ),
    CInfo(
        name: "Image",
        seas: [
            LangSwiftUIItem(name: "Image - 图片", searchKeyword: "", viewname: AnyView(v_Image()))
        ]
    ),
    CInfo(
        name: "Layout Containers",
        seas: [
            LangSwiftUIItem(name: "Layout - VStack | HStack | ZStack 布局", searchKeyword: "", viewname: AnyView(v_Layout())),
            LangSwiftUIItem(name: "Grid", searchKeyword: "", viewname: AnyView(v_Grid())),
            LangSwiftUIItem(name: "Divider", searchKeyword: "", viewname: AnyView(v_Divider())),
            LangSwiftUIItem(name: "Spacer", searchKeyword: "", viewname: AnyView(v_Spacer()))
        ]
    ),
    CInfo(
        name: "Controls",
        seas: [
            LangSwiftUIItem(name: "Button - 按钮", searchKeyword: "", viewname: AnyView(v_Button())),
            LangSwiftUIItem(name: "PasteButton", searchKeyword: "", viewname: AnyView(v_PasteButton())),
            LangSwiftUIItem(name: "Slider - 滑块", searchKeyword: "", viewname: AnyView(v_Slider())),
            LangSwiftUIItem(name: "Stepper", searchKeyword: "", viewname: AnyView(v_Stepper())),
            LangSwiftUIItem(name: "Picker - 选择器", searchKeyword: "", viewname: AnyView(v_Picker())),
            LangSwiftUIItem(name: "Toggle", searchKeyword: "", viewname: AnyView(v_Toggle())),
            LangSwiftUIItem(name: "Link - 链接", searchKeyword: "", viewname: AnyView(v_Link())),
            LangSwiftUIItem(name: "Menu & contextMenu", searchKeyword: "", viewname: AnyView(v_Menu())),
            LangSwiftUIItem(name: "Alert", searchKeyword: "", viewname: AnyView(v_Alert())),
            LangSwiftUIItem(name: "SwipeActions", searchKeyword: "", viewname: AnyView(v_swipeActions())),
            LangSwiftUIItem(name: "ProgressView", searchKeyword: "", viewname: AnyView(v_ProgressView())),
        ]
    ),
    CInfo(
        name: "ActionSheet",
        seas: [
            LangSwiftUIItem(name: "ActionSheet", searchKeyword: "", viewname: AnyView(v_ActionSheet())),
            LangSwiftUIItem(name: "confirmationDialog", searchKeyword: "", viewname: AnyView(v_confirmationDialog()))
        ]
    ),
    CInfo(
        name: "Conllection Containers",
        seas: [
            LangSwiftUIItem(name: "List - 列表", searchKeyword: "", viewname: AnyView(v_List())),
            LangSwiftUIItem(name: "Form - 表单", searchKeyword: "", viewname: AnyView(v_Form())),
            LangSwiftUIItem(name: "LabeledContent", searchKeyword: "", viewname: AnyView(v_LabeledContent())),
            LangSwiftUIItem(name: "GroupBox", searchKeyword: "", viewname: AnyView(v_GroupBox())),
            LangSwiftUIItem(name: "ScrollView", searchKeyword: "", viewname: AnyView(v_ScrollView())),
            LangSwiftUIItem(name: "ScrollViewReader", searchKeyword: "", viewname: AnyView(v_ScrollViewReader())),
            LangSwiftUIItem(name: "Table - 表格", searchKeyword: "", viewname: AnyView(v_Table())),
        ]
    ),
    CInfo(
        name: "View",
        seas: [
            LangSwiftUIItem(name: "Sheet", searchKeyword: "", viewname: AnyView(v_Sheet())),
            LangSwiftUIItem(name: "fullScreenCover", searchKeyword: "", viewname: AnyView(v_fullScreenCover())),
            LangSwiftUIItem(name: "Popover", searchKeyword: "", viewname: AnyView(v_Popover()))
        ]
    ),
    CInfo(
        name: "Presentains Containers",
        seas: [
            LangSwiftUIItem(name: "Navigation", searchKeyword: "", viewname: AnyView(v_Navigation())),
            LangSwiftUIItem(name: "OutlineGroup", searchKeyword: "", viewname: AnyView(v_OutlineGroup())),
            LangSwiftUIItem(name: "DisclosureGroup", searchKeyword: "", viewname: AnyView(v_DisclosureGroup())),
            LangSwiftUIItem(name: "TabView", searchKeyword: "", viewname: AnyView(v_Tab())),
            LangSwiftUIItem(name: "TimeLineView", searchKeyword: "", viewname: AnyView(v_TimelineView()))
        ]
    ),
    CInfo(
        name: "Map",
        seas: [
            LangSwiftUIItem(name: "Map - 地图", searchKeyword: "", viewname: AnyView(v_Maps()))
        ]
    ),
    CInfo(
        name: "Canvas",
        seas: [
            LangSwiftUIItem(name: "Canvas", searchKeyword: "", viewname: AnyView(v_Canvas()))
        ]
    ),
    CInfo(
        name: "Chart",
        seas: [
            LangSwiftUIItem(name: "BarMark - 柱状图", searchKeyword: "", viewname: AnyView(chart_BarMark())),
            LangSwiftUIItem(name: "LinkMark - 线形图", searchKeyword: "", viewname: AnyView(chart_LineMark())),
            LangSwiftUIItem(name: "PointMark - 散点图", searchKeyword: "", viewname: AnyView(chart_PointMark())),
        ]
    ),
    CInfo(
        name: "Animation - 动画",
        seas: [
            LangSwiftUIItem(name: "shadow", searchKeyword: "", viewname: AnyView(Shadow())),
            LangSwiftUIItem(name: "mask", searchKeyword: "", viewname: AnyView(Mask())),
            LangSwiftUIItem(name: "transitions", searchKeyword: "", viewname: AnyView(Transitions())),
            LangSwiftUIItem(name: "timing", searchKeyword: "", viewname: AnyView(Timing())),
            LangSwiftUIItem(name: "Effect", searchKeyword: "", viewname: AnyView(Effect())),
            LangSwiftUIItem(name: "withAnimation", searchKeyword: "", viewname: AnyView(a_withAnimation()))
        ]
    ),
    CInfo(
        name: "形状、手势等",
        seas: [
            LangSwiftUIItem(name: "Gradient - 渐变", searchKeyword: "", viewname: AnyView(v_Gradient())),
            LangSwiftUIItem(name: "Shape - 形状", searchKeyword: "", viewname: AnyView(v_shape())),
            LangSwiftUIItem(name: "Gesture - 手势", searchKeyword: "", viewname: AnyView(v_Gesture()))
        ]
    ),
    CInfo(
        name: "其它",
        seas: [
            LangSwiftUIItem(name: "statusBar - 隐藏状态栏", searchKeyword: "", viewname: AnyView(v_statusBar())),
            LangSwiftUIItem(name: "blur - 模糊", searchKeyword: "", viewname: AnyView(v_blur())),
            LangSwiftUIItem(name: "fileExporter - 导出", searchKeyword: "", viewname: AnyView(v_fileExporter()))
        ]
    )
]

