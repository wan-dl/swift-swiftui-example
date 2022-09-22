//
//  v_section.swift
//  HelloSwift
//
//  Created by 1 on 9/22/22.
//

import SwiftUI

struct v_section: View {
    @State var phone: String = ""
    @State var passwd: String = ""
    
    var body: some View {
        Form {
            Text("关于Section, 常用来分组。通常在 List、Picker、Form中使用。\n\n如下示例，注意文字: 水果分类、语言分类")
                .foregroundColor(.gray)
                .font(.callout)
                .frame(minHeight: 60)
            
            Section("水果分类") {
                Text("香蕉")
                Text("苹果")
            }
            
            Section(header: Text("语言分类").foregroundColor(.red)) {
                Text("Python")
                Text("JavaScript")
            }
            
            Section("") {
                TextField("手机号", text: $phone)
                TextField("密码", text: $passwd)
            }
        }
        .navigationTitle("Section")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Section"))
    }
}

struct v_section_Previews: PreviewProvider {
    static var previews: some View {
        v_section()
    }
}
