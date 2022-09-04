//
//  Controls.swift
//  format
//
//  Created by 1 on 7/26/22.
//  Updated by 1 on 2022-08-20 增加搜索
//

import SwiftUI

struct Sea: Identifiable {
    let name: String
    let id = UUID()
    let viewname: AnyView
}

struct CInfo: Identifiable {
    let id: UUID = UUID()
    let name: String
    var seas: [Sea]
}

enum ViewName {
    case text
}

private var uiList: [CInfo] = [
    CInfo(
        name: "Text Input and Output",
        seas: [
            Sea(name: "Text", viewname: AnyView(v_Text())),
            Sea(name: "Label", viewname: AnyView(v_Label())),
            Sea(name: "TextField - 文本输入框", viewname: AnyView(v_Input())),
            Sea(name: "TextEditor - 多行文本框", viewname: AnyView(v_TextEditor())),
        ]
    ),
    CInfo(name: "Image - 图片", seas: [Sea(name: "Image", viewname: AnyView(v_Image()))]),
    CInfo(
        name: "Layout Containers",
        seas: [
            Sea(name: "Layout - VStack | HStack | ZStack 布局", viewname: AnyView(v_Layout())),
            Sea(name: "Grid", viewname: AnyView(v_Grid())),
            Sea(name: "Divider", viewname: AnyView(v_Divider())),
            Sea(name: "Spacer", viewname: AnyView(v_Spacer()))
        ]
    ),
    CInfo(
        name: "Controls",
        seas: [
            Sea(name: "Button - 按钮", viewname: AnyView(v_Button())),
            Sea(name: "PasteButton", viewname: AnyView(v_PasteButton())),
            Sea(name: "Slider", viewname: AnyView(v_Slider())),
            Sea(name: "Stepper", viewname: AnyView(v_Stepper())),
            Sea(name: "Picker - 选择器", viewname: AnyView(v_Picker())),
            Sea(name: "Toggle", viewname: AnyView(v_Toggle())),
            Sea(name: "Link - 链接", viewname: AnyView(v_Link())),
            Sea(name: "Menu & contextMenu", viewname: AnyView(v_Menu())),
            Sea(name: "Alert", viewname: AnyView(v_Alert())),
            Sea(name: "ActionSheet", viewname: AnyView(v_ActionSheet())),
            Sea(name: "SwipeActions", viewname: AnyView(v_swipeActions()))
        ]
    ),
    CInfo(
        name: "Conllection Containers",
        seas: [
            Sea(name: "List - 列表", viewname: AnyView(v_List())),
            Sea(name: "Form", viewname: AnyView(v_Form())),
            Sea(name: "GroupBox", viewname: AnyView(v_GroupBox())),
            Sea(name: "ScrollView", viewname: AnyView(v_ScrollView())),
            Sea(name: "ScrollViewReader", viewname: AnyView(v_ScrollViewReader())),
            Sea(name: "Table - 表格", viewname: AnyView(v_Table())),
        ]
    ),
    CInfo(
        name: "Presentains Containers",
        seas: [
            Sea(name: "Navigation", viewname: AnyView(v_Navigation())),
            Sea(name: "OutlineGroup", viewname: AnyView(v_OutlineGroup())),
            Sea(name: "DisclosureGroup", viewname: AnyView(v_DisclosureGroup())),
            Sea(name: "TabView", viewname: AnyView(v_Tab())),
            Sea(name: "TimeLineView", viewname: AnyView(v_TimelineView()))
        ]
    ),
    CInfo(
        name: "View",
        seas: [
            Sea(name: "ProgressView", viewname: AnyView(v_ProgressView())),
            Sea(name: "Sheet", viewname: AnyView(v_Sheet())),
            Sea(name: "fullScreenCover", viewname: AnyView(v_fullScreenCover())),
            Sea(name: "Popover", viewname: AnyView(v_Popover())),
            Sea(name: "confirmationDialog", viewname: AnyView(v_confirmationDialog())),
        ]
    ),
    CInfo(
        name: "Map",
        seas: [
            Sea(name: "Map - 地图", viewname: AnyView(v_Maps()))
        ]
    ),
    CInfo(
        name: "Canvas",
        seas: [
            Sea(name: "Canvas", viewname: AnyView(v_Canvas()))
        ]
    ),
    CInfo(
        name: "Chart",
        seas: [
            Sea(name: "BarMark - 柱状图", viewname: AnyView(chart_BarMark())),
            Sea(name: "LinkMark - 线形图", viewname: AnyView(chart_LineMark())),
            Sea(name: "PointMark - 散点图", viewname: AnyView(chart_PointMark())),
        ]
    ),
    CInfo(
        name: "Animation - 动画",
        seas: [
            Sea(name: "shadow", viewname: AnyView(Shadow())),
            Sea(name: "mask", viewname: AnyView(Mask())),
            Sea(name: "transitions", viewname: AnyView(Transitions())),
            Sea(name: "timing", viewname: AnyView(Timing())),
            Sea(name: "Effect", viewname: AnyView(Effect())),
            Sea(name: "withAnimation", viewname: AnyView(a_withAnimation()))
        ]
    ),
    CInfo(
        name: "形状、手势等",
        seas: [
            Sea(name: "Gradient - 渐变", viewname: AnyView(v_Gradient())),
            Sea(name: "Shape - 形状", viewname: AnyView(v_shape())),
            Sea(name: "Gesture - 手势", viewname: AnyView(v_Gesture()))
        ]
    ),
    CInfo(
        name: "其它",
        seas: [
            Sea(name: "statusBar - 隐藏状态栏", viewname: AnyView(v_statusBar())),
            Sea(name: "blur - 模糊", viewname: AnyView(v_blur())),
            Sea(name: "fileExporter - 导出", viewname: AnyView(v_fileExporter()))
        ]
    )
]


struct ComponentsView: View {
    
    @State var searchKeyword: String = ""
    
    var body: some View {
        VStack {
            List(searchResults, id: \.id) { item in
                Section(header: Text(item.name).textCase(.none)) {
                    ForEach(item.seas, id:\.id) { item2 in
                        NavigationLink(item2.name, destination: item2.viewname)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .searchable(text: $searchKeyword, placement: SearchFieldPlacement.automatic, prompt: "搜索")
        }
        .navigationTitle("SwiftUI组件")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 44)
        })
    }
    
    var searchResults: [CInfo] {
        if searchKeyword.isEmpty {
            return uiList
        }
        var result: [CInfo] = []
        for i1 in uiList {
            var tmp = CInfo(name: i1.name, seas: [])
            for i2 in i1.seas {
                let viewname: String = i2.name.lowercased()
                if viewname.contains(searchKeyword.lowercased()) {
                    tmp.seas.append(i2)
                }
            }
            if !tmp.seas.isEmpty {
                result.append(tmp)
            }
        }
        return result
    }
}

struct ComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentsView()
    }
}
