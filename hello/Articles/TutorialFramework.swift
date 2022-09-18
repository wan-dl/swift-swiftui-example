//
//  TutorialFramework.swift
//  HelloSwift
//
//  Created by 1 on 9/10/22.
//

import SwiftUI

struct TutorialFramework: View {
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("App内，底部选项卡 “API”页面，演示了部分iOS系统API，如网络请求、选择相册照片、定位、分享等。")
                Text("下面罗列一些常用的iOS系统框架列表")
            }
            .padding()
            
            List {
                ForEach(FrameworkList, id: \.id) { sea in
                    Section(header: Text(sea.name).font(.headline).foregroundColor(.black)) {
                        ForEach(sea.seas) { item in
                            HStack {
                                Text(item.name)
                                Text(item.available)
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.init(uiColor: UIColor(hexString: "#F2F6FE")))
        .navigationTitle("Framework")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TutorialFramework_Previews: PreviewProvider {
    static var previews: some View {
        TutorialFramework()
    }
}
