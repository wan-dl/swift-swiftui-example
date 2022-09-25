//
//  v_NavigationSetting.swift
//  HelloSwift
//
//  Created by 1 on 9/25/22.
//

import SwiftUI

// 导航栏标题显示模式
enum DisplayModeList: String, CaseIterable, Identifiable  {
    case automatic
    case large
    case inline
    var id: Self { self }
}


struct v_NavigationSetting: View {
    
    @State private var isHiddenBackButton: Bool = false
    
    @State private var selectedMode: DisplayModeList = .inline
    @State private var selectedNavigationBarTitleDisplayMode: NavigationBarItem.TitleDisplayMode = .inline
    
    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("NavigationLink的使用").textCase(.none)) {
                    NavigationLink("跳转到首页", destination: Home())
                }
                
                Toggle("是否隐藏导航栏返回按钮", isOn: $isHiddenBackButton)
                
                Section("导航栏标题样式, 修改后滑动一下屏幕，即可看到效果") {
                    Picker("导航栏标题样式", selection: $selectedMode) {
                        ForEach(DisplayModeList.allCases) { item in
                            Text(item.rawValue.capitalized)
                        }
                        .onChange(of: selectedMode) { val in
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                switch(selectedMode) {
                                case .automatic:
                                    selectedNavigationBarTitleDisplayMode = .automatic
                                case .inline:
                                    selectedNavigationBarTitleDisplayMode = .inline
                                case .large:
                                    selectedNavigationBarTitleDisplayMode = .large
                                }
                            }
                        }
                    }
                }
                
            }
        }
        .navigationTitle("Navigation Setting")
        .navigationBarBackButtonHidden(isHiddenBackButton)
        .navigationBarTitleDisplayMode(selectedNavigationBarTitleDisplayMode)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "NavigationSetting"))
    }
}

struct v_NavigationSetting_Previews: PreviewProvider {
    static var previews: some View {
        v_NavigationSetting()
    }
}
