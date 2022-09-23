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
            LangSwiftUIItem(name: "ProgressView", searchKeyword: "loading,进度条", available: "iOS 14.0+", viewname: AnyView(v_ProgressView())),
            LangSwiftUIItem(name: ".alert() - 弹窗", searchKeyword: "弹窗,.alert()", available: "", viewname: AnyView(v_Alert())),
            LangSwiftUIItem(name: ".swipeActions()", searchKeyword: ".swipeActions()", available: "iOS 15.0+", viewname: AnyView(v_swipeActions())),
        ]
    ),
    CInfo(
        name: "ActionSheet",
        seas: [
            LangSwiftUIItem(name: ".actionSheet()", searchKeyword: ".actionSheet()", available: "iOS 13.0–16.0", viewname: AnyView(v_ActionSheet())),
            LangSwiftUIItem(name: ".confirmationDialog()", searchKeyword: ".confirmationDialog()", available: "iOS 15.0+", viewname: AnyView(v_confirmationDialog()))
        ]
    ),
    CInfo(
        name: "导航栏|工具栏",
        seas: [
            LangSwiftUIItem(name: ".toolbar() - 导航栏|工具栏", searchKeyword: ".toolbar(),导航栏,工具栏", available: "iOS 14.0+", viewname: AnyView(v_toolbar())),
            LangSwiftUIItem(name: ".navigationBarItems() - 导航栏", searchKeyword: ".navigationBarItems(),导航栏", available: "iOS 13.0–16.0 ", viewname: AnyView(v_navigationBarItems()))
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
        name: "",
        seas: [
            LangSwiftUIItem(name: "Section", searchKeyword: "", available: "", viewname: AnyView(v_section())),
            LangSwiftUIItem(name: "Group", searchKeyword: "", available: "", viewname: AnyView(v_Group()))
        ]
    ),
    CInfo(
        name: "View",
        seas: [
            LangSwiftUIItem(name: ".sheet() - 工作表", searchKeyword: ".sheet()", available: "iOS 13.0+", viewname: AnyView(v_Sheet())),
            LangSwiftUIItem(name: ".fullScreenCover() - 全屏视图", searchKeyword: ".fullScreenCover()", available: "iOS 14.0+", viewname: AnyView(v_fullScreenCover())),
            LangSwiftUIItem(name: ".popover()", searchKeyword: ".popover()", available: "iOS 13.0+", viewname: AnyView(v_Popover()))
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
        name: "定位",
        seas: [
            LangSwiftUIItem(name: ".position() - 绝对定位", searchKeyword: "", available: "", viewname: AnyView(v_position())),
            LangSwiftUIItem(name: ".offset() - 偏移", searchKeyword: "", available: "", viewname: AnyView(v_offset()))
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
            LangSwiftUIItem(name: "BarMark - 柱状图", searchKeyword: "图表,chart", available: "iOS 16.0+", viewname: AnyView(chart_BarMark())),
            LangSwiftUIItem(name: "LinkMark - 线形图", searchKeyword: "图表,chart", available: "iOS 16.0+", viewname: AnyView(chart_LineMark())),
            LangSwiftUIItem(name: "PointMark - 散点图", searchKeyword: "图表,chart", available: "iOS 16.0+", viewname: AnyView(chart_PointMark())),
        ]
    ),
    CInfo(
        name: "Animation - 动画",
        seas: [
            LangSwiftUIItem(name: ".shadow()", searchKeyword: "", available: "", viewname: AnyView(Shadow())),
            LangSwiftUIItem(name: ".mask()", searchKeyword: "", available: "", viewname: AnyView(Mask())),
            LangSwiftUIItem(name: ".transition()", searchKeyword: "", available: "", viewname: AnyView(Transitions())),
            LangSwiftUIItem(name: "timing", searchKeyword: "", available: "", viewname: AnyView(Timing())),
            LangSwiftUIItem(name: "Effect", searchKeyword: ".rotationEffect(),.rotation3DEffect()", available: "", viewname: AnyView(Effect())),
            LangSwiftUIItem(name: "withAnimation", searchKeyword: "", available: "iOS 13.0+", viewname: AnyView(a_withAnimation()))
        ]
    ),
    CInfo(
        name: "形状、手势等",
        seas: [
            LangSwiftUIItem(name: "Gradient - 渐变", searchKeyword: ".linearGradient()", available: "iOS 13.0+", viewname: AnyView(v_Gradient())),
            LangSwiftUIItem(name: "Shapes - 形状", searchKeyword: "Circle(),Rectangle(),RoundedRectangle(),Ellipse(),Capsule(),椭圆,圆形,正方形,长方形,胶囊", available: "", viewname: AnyView(v_shape())),
            LangSwiftUIItem(name: "Gesture - 手势", searchKeyword: "点击,长按,拖曳,旋转,缩放,.onTapGesture(),.onLongPressGesture(),LongPressGesture(),DragGesture(),MagnificationGesture(),RotationGesture()", available: "", viewname: AnyView(v_Gesture()))
        ]
    ),
    CInfo(
        name: "其它",
        seas: [
            LangSwiftUIItem(name: ".statusBarHidden() - 隐藏状态栏", searchKeyword: ".statusBarHidden()", available: "", viewname: AnyView(v_statusBar())),
            LangSwiftUIItem(name: ".blur() - 模糊", searchKeyword: ".blur()", available: "", viewname: AnyView(v_blur())),
            LangSwiftUIItem(name: ".fileExporter() - 导出", searchKeyword: "", available: "", viewname: AnyView(v_fileExporter()))
        ]
    ),
    CInfo(
        name: "安全区域",
        seas: [
            LangSwiftUIItem(name: ".ignoresSafeArea()", searchKeyword: "安全区域,edges,regions", available: "iOS 14.0+", viewname: AnyView(v_ignoresSafeArea())),
            LangSwiftUIItem(name: ".safeAreaInset()", searchKeyword: "安全区域,edge,regions", available: "iOS 15.0+", viewname: AnyView(v_safeAreaInset()))
        ]
    ),
]

let SwiftUIComponentsChildList: [CInfo] = [
    CInfo(
        name: "",
        seas: [
            LangSwiftUIItem(name: "TextField - 输入框样式", searchKeyword: "TextField,input", available: "", viewname: AnyView(InputStyle())),
            LangSwiftUIItem(name: "TextField - 自动获取焦点的输入框", searchKeyword: "TextField,input", available: "", viewname: AnyView(InputAutoFocus())),
            LangSwiftUIItem(name: "TextField - 收起键盘", searchKeyword: "TextField,input,输入框", available: "", viewname: AnyView(InputCloseKeyBoard())),
            LangSwiftUIItem(name: "TextField - 带有图标的输入框", searchKeyword: "TextField,input", available: "", viewname: AnyView(InputWithIcon())),
            LangSwiftUIItem(name: "TextField - 键盘右下角按钮", searchKeyword: "TextField,input,输入框", available: "", viewname: AnyView(InputKeyboardButtons())),
            LangSwiftUIItem(name: "TextField - 输入框显示不同的键盘类型", searchKeyword: "TextField,input", available: "", viewname: AnyView(InputKeyboardType())),
            LangSwiftUIItem(name: "TextField - 密码输入框", searchKeyword: "TextField,input", available: "", viewname: AnyView(InputSecureField())),
            LangSwiftUIItem(name: "TextField - 格式化输入内容 - formatter", searchKeyword: "TextField,input,输入框", available: "", viewname: AnyView(InputFormatter())),
            LangSwiftUIItem(name: "TextField - onEditingChanged & onCommit", searchKeyword: "TextField,input,输入框", available: "", viewname: AnyView(InputOn())),
            LangSwiftUIItem(name: "TextField - 输入框光标颜色", searchKeyword: "TextField,input", available: "", viewname: AnyView(InputAccentColor())),
            LangSwiftUIItem(name: "TextField - 输入框边框颜色", searchKeyword: "TextField,input", available: "", viewname: AnyView(InputBorder())),
            LangSwiftUIItem(name: "Image - SF符号", searchKeyword: "图片", available: "", viewname: AnyView(v_image_SF())),
            LangSwiftUIItem(name: "Image - Assets图片", searchKeyword: "", available: "", viewname: AnyView(v_image_local())),
            LangSwiftUIItem(name: "Image - 使用URLSession下载图片", searchKeyword: "", available: "", viewname: AnyView(v_image_URLSession())),
            LangSwiftUIItem(name: "Image - 使用AsyncImage下载图片", searchKeyword: "", available: "", viewname: AnyView(v_image_AsyncImage())),
            LangSwiftUIItem(name: ".onTapGesture() - 点击", searchKeyword: ".gesture()", available: "", viewname: AnyView(v_onTapGesture())),
            LangSwiftUIItem(name: "SpatialTapGesture", searchKeyword: ".gesture()", available: "iOS 16.0+", viewname: AnyView(v_SpatialTapGesture())),
            LangSwiftUIItem(name: ".onLongPressGesture()", searchKeyword: ".gesture()", available: "", viewname: AnyView(v_onLongPressGesture())),
            LangSwiftUIItem(name: ".gesture( LongPressGesture() )", searchKeyword: ".gesture()", available: "", viewname: AnyView(v_gesture_LongPressGesture())),
            LangSwiftUIItem(name: "DragGesture() - 拖拽", searchKeyword: ".gesture()", available: "", viewname: AnyView(v_DragGesture())),
            LangSwiftUIItem(name: "MagnificationGesture() - 缩放", searchKeyword: ".gesture()", available: "", viewname: AnyView(v_MagnificationGesture())),
            LangSwiftUIItem(name: "RotationGesture() - 旋转", searchKeyword: ".gesture()", available: "", viewname: AnyView(v_RotationGesture()))
        ]
    )
]


let SwiftUIAllIComponentsList = SwiftUIComponentsList + SwiftUIComponentsChildList
