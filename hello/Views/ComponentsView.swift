//
//  Controls.swift
//  format
//
//  Created by hx on 7/26/22.
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
    let seas: [Sea]
}

enum ViewName {
    case text
}

private let uiList: [CInfo] = [
    CInfo(
        name: "Text Input and Output",
        seas: [
            Sea(name: "Text", viewname: AnyView(v_Text())),
            Sea(name: "Label", viewname: AnyView(v_Label())),
            Sea(name: "TextField", viewname: AnyView(v_Input())),
            Sea(name: "TextEditor", viewname: AnyView(v_TextEditor())),
        ]
    ),
    CInfo(name: "Image", seas: [Sea(name: "Image", viewname: AnyView(v_Image()))]),
    CInfo(
        name: "Controls",
        seas: [
            Sea(name: "Button", viewname: AnyView(v_Button())),
            Sea(name: "Slider", viewname: AnyView(v_Slider())),
            Sea(name: "Stepper", viewname: AnyView(v_Stepper())),
            Sea(name: "Picker", viewname: AnyView(v_Picker())),
            Sea(name: "Toggle", viewname: AnyView(v_Toggle())),
            Sea(name: "Link", viewname: AnyView(v_Link())),
            Sea(name: "Menu", viewname: AnyView(v_Menu())),
            Sea(name: "Alert", viewname: AnyView(v_Alert())),
            Sea(name: "ActionSheet", viewname: AnyView(v_ActionSheet())),
            Sea(name: "SwipeActions", viewname: AnyView(v_swipeActions()))
        ]
    ),
    CInfo(
        name: "Layout Containers",
        seas: [
            Sea(name: "Layout - VStack | HStack | ZStack", viewname: AnyView(v_Layout())),
            Sea(name: "Grid", viewname: AnyView(v_Grid())),
            Sea(name: "Divider", viewname: AnyView(v_Divider())),
            Sea(name: "Spacer", viewname: AnyView(v_Spacer()))
        ]
    ),
    CInfo(
        name: "Conllection Containers",
        seas: [
            Sea(name: "List", viewname: AnyView(v_List())),
            Sea(name: "Form", viewname: AnyView(v_Form())),
            Sea(name: "GroupBox", viewname: AnyView(v_GroupBox())),
            Sea(name: "ScrollView", viewname: AnyView(v_ScrollView())),
            Sea(name: "ScrollViewReader", viewname: AnyView(v_ScrollViewReader())),
            Sea(name: "Table", viewname: AnyView(v_Table())),
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
            Sea(name: "FullScreenCover", viewname: AnyView(v_fullScreenCover())),
            Sea(name: "Popover", viewname: AnyView(v_Popover())),
            Sea(name: "Dialog", viewname: AnyView(v_Dialog())),
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
            Sea(name: "BarMark", viewname: AnyView(chart_BarMark())),
            Sea(name: "LinkMark", viewname: AnyView(chart_LineMark())),
            Sea(name: "PointMark", viewname: AnyView(chart_PointMark())),
        ]
    ),
    CInfo(
        name: "其它",
        seas: [
            Sea(name: "Gradient - 渐变", viewname: AnyView(v_Gradient())),
            Sea(name: "Shape - 形状", viewname: AnyView(v_shape())),
            Sea(name: "Gesture - 手势", viewname: AnyView(v_Gesture()))
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
    )
]


struct ComponentsView: View {
    
    init() {
        
    }
    
    var body: some View {
        VStack {
            List(uiList, id: \.id) { item in
                Section(header: Text(item.name).textCase(.none)) {
                    ForEach(item.seas, id:\.id) { item2 in
                        NavigationLink(item2.name, destination: item2.viewname)
                    }
                }
                
            }
            .listStyle(.insetGrouped)
        }
        .navigationTitle("SwiftUI")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 44)
        })
    }
}

struct ComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentsView()
    }
}
