//
//  Config.swift
//  HelloSwift
//
//  Created by 1 on 9/9/22.
//

import Foundation
import SwiftUI

struct LangSwiftUIItem: Identifiable {
    let id = UUID()
    var name: String
    var searchKeyword: String
    var available: String
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
            LangSwiftUIItem(name: "Text - 文本", searchKeyword: ".font字体,.fontWeight字重,.foregoundColor前景色,.italic斜体,.bold粗体,.underline下划线,.textCase大小写,.strikethrough删除线, .linelimit超出截断,.background背景色,.linespacing行间距,.textselection选中", available: "iOS 13.0+", viewname: AnyView(v_Text())),
            LangSwiftUIItem(name: "Label", searchKeyword: "", available: "iOS 14.0+", viewname: AnyView(v_Label())),
            LangSwiftUIItem(name: "TextField - 文本输入框", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_TextField())),
            LangSwiftUIItem(name: "TextEditor - 多行文本框", searchKeyword: "", available: "iOS 14.0+", viewname: AnyView(v_TextEditor())),
        ]
    ),
    CInfo(
        name: "Image",
        seas: [
            LangSwiftUIItem(name: "Image - 图片", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_Image()))
        ]
    ),
    CInfo(
        name: "Layout Containers",
        seas: [
            LangSwiftUIItem(name: "Layout - VStack | HStack | ZStack 布局", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_Layout())),
            LangSwiftUIItem(name: "Grid", searchKeyword: "", available: "iOS 16.0+", viewname: AnyView(v_Grid())),
            LangSwiftUIItem(name: "Divider", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_Divider())),
            LangSwiftUIItem(name: "Spacer", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_Spacer()))
        ]
    ),
    CInfo(
        name: "Controls",
        seas: [
            LangSwiftUIItem(name: "Button - 按钮", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_Button())),
            LangSwiftUIItem(name: "PasteButton", searchKeyword: "", available: "iOS 16.0+", viewname: AnyView(v_PasteButton())),
            LangSwiftUIItem(name: "Slider - 滑块", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_Slider())),
            LangSwiftUIItem(name: "Stepper", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_Stepper())),
            LangSwiftUIItem(name: "Picker - 选择器", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_Picker())),
            LangSwiftUIItem(name: "Toggle", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_Toggle())),
            LangSwiftUIItem(name: "Link | ShareLink - 链接", searchKeyword: "", available: "iOS 14.0+", viewname: AnyView(v_Link())),
            LangSwiftUIItem(name: "Menu", searchKeyword: ".menuOrder,目录", available: "iOS 14.0+", viewname: AnyView(v_Menu())),
            LangSwiftUIItem(name: "contextMenu", searchKeyword: "目录", available: "iOS 13.0–16.0", viewname: AnyView(v_contextMenu())),
            LangSwiftUIItem(name: "Alert", searchKeyword: "弹窗", available: "", viewname: AnyView(v_Alert())),
            LangSwiftUIItem(name: "SwipeActions", searchKeyword: "", available: "iOS 15.0+", viewname: AnyView(v_swipeActions())),
            LangSwiftUIItem(name: "ProgressView", searchKeyword: "loading,进度条", available: "iOS 14.0+", viewname: AnyView(v_ProgressView())),
        ]
    ),
    CInfo(
        name: "ActionSheet",
        seas: [
            LangSwiftUIItem(name: "ActionSheet", searchKeyword: "", available: "iOS 13.0–16.0", viewname: AnyView(v_ActionSheet())),
            LangSwiftUIItem(name: "confirmationDialog", searchKeyword: "", available: "iOS 15.0+", viewname: AnyView(v_confirmationDialog()))
        ]
    ),
    CInfo(
        name: "Conllection Containers",
        seas: [
            LangSwiftUIItem(name: "List - 列表", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_List())),
            LangSwiftUIItem(name: "Form - 表单", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_Form())),
            LangSwiftUIItem(name: "LabeledContent", searchKeyword: "", available: "iOS 16.0+", viewname: AnyView(v_LabeledContent())),
            LangSwiftUIItem(name: "GroupBox", searchKeyword: "", available: "iOS 14.0+", viewname: AnyView(v_GroupBox())),
            LangSwiftUIItem(name: "ScrollView - 滚动视图", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_ScrollView())),
            LangSwiftUIItem(name: "ScrollViewReader - 滚动视图锚点", searchKeyword: "", available: "iOS 14.0+", viewname: AnyView(v_ScrollViewReader())),
            LangSwiftUIItem(name: "Table - 表格", searchKeyword: "", available: "iOS 16.0+", viewname: AnyView(v_Table())),
        ]
    ),
    CInfo(
        name: "View",
        seas: [
            LangSwiftUIItem(name: "Sheet - 视图", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_Sheet())),
            LangSwiftUIItem(name: "fullScreenCover - 全屏视图", searchKeyword: "", available: "iOS 14.0+", viewname: AnyView(v_fullScreenCover())),
            LangSwiftUIItem(name: "Popover", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_Popover()))
        ]
    ),
    CInfo(
        name: "Presentains Containers",
        seas: [
            LangSwiftUIItem(name: "NavigationLink", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_Navigation())),
            LangSwiftUIItem(name: "OutlineGroup", searchKeyword: "", available: "iOS 14.0+", viewname: AnyView(v_OutlineGroup())),
            LangSwiftUIItem(name: "DisclosureGroup", searchKeyword: "", available: "iOS 14.0+", viewname: AnyView(v_DisclosureGroup())),
            LangSwiftUIItem(name: "TabView", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(v_Tab())),
            LangSwiftUIItem(name: "TimeLineView", searchKeyword: "", available: "iOS 15.0+", viewname: AnyView(v_TimelineView()))
        ]
    ),
    CInfo(
        name: "Map",
        seas: [
            LangSwiftUIItem(name: "Map - 地图", searchKeyword: "", available: "iOS 14.0+", viewname: AnyView(v_Maps()))
        ]
    ),
    CInfo(
        name: "Canvas",
        seas: [
            LangSwiftUIItem(name: "Canvas", searchKeyword: "", available: "iOS 15.0+", viewname: AnyView(v_Canvas()))
        ]
    ),
    CInfo(
        name: "Chart",
        seas: [
            LangSwiftUIItem(name: "BarMark - 柱状图", searchKeyword: "", available: "iOS 16.0+", viewname: AnyView(chart_BarMark())),
            LangSwiftUIItem(name: "LinkMark - 线形图", searchKeyword: "", available: "iOS 16.0+", viewname: AnyView(chart_LineMark())),
            LangSwiftUIItem(name: "PointMark - 散点图", searchKeyword: "", available: "iOS 16.0+", viewname: AnyView(chart_PointMark())),
        ]
    ),
    CInfo(
        name: "Animation - 动画",
        seas: [
            LangSwiftUIItem(name: "shadow", searchKeyword: "", available: "", viewname: AnyView(Shadow())),
            LangSwiftUIItem(name: "mask", searchKeyword: "", available: "", viewname: AnyView(Mask())),
            LangSwiftUIItem(name: "transitions", searchKeyword: "", available: "", viewname: AnyView(Transitions())),
            LangSwiftUIItem(name: "timing", searchKeyword: "", available: "", viewname: AnyView(Timing())),
            LangSwiftUIItem(name: "Effect", searchKeyword: "", available: "", viewname: AnyView(Effect())),
            LangSwiftUIItem(name: "withAnimation", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(a_withAnimation()))
        ]
    ),
    CInfo(
        name: "形状、手势等",
        seas: [
            LangSwiftUIItem(name: "Gradient - 渐变", searchKeyword: "linearGradient", available: "iOS 13.0+", viewname: AnyView(v_Gradient())),
            LangSwiftUIItem(name: "Shapes - 形状", searchKeyword: "", available: "", viewname: AnyView(v_shape())),
            LangSwiftUIItem(name: "Gesture - 手势", searchKeyword: "", available: "", viewname: AnyView(v_Gesture()))
        ]
    ),
    CInfo(
        name: "其它",
        seas: [
            LangSwiftUIItem(name: "statusBar - 隐藏状态栏", searchKeyword: "", available: "", viewname: AnyView(v_statusBar())),
            LangSwiftUIItem(name: "blur - 模糊", searchKeyword: "", available: "", viewname: AnyView(v_blur())),
            LangSwiftUIItem(name: "fileExporter - 导出", searchKeyword: "", available: "", viewname: AnyView(v_fileExporter()))
        ]
    )
]

