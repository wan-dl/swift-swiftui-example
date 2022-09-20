//
//  TutorialFirst.swift
//  HelloSwift
//
//  Created by 1 on 9/17/22.
//

import SwiftUI

struct elm: Identifiable {
    let id = UUID()
    var sn: String
    var docId: String
    var title: String
    var desc: String
    var icon: String
    var viewName: AnyView
}


var startList: [elm] = [
    elm(sn: "1", docId: "introduce", title: "准备", desc: "学习前的准备", icon: "doc.viewfinder", viewName: AnyView(TutorialIntroduction())),
    elm(sn: "2", docId: "CreateProject", title: "新建并运行项目", desc: "使用Xcode创建Swift和SwiftUI项目", icon: "plus.square", viewName: AnyView(TutorialCreateProject())),
    elm(sn: "3", docId: "Account", title: "申请Apple开发者账号", desc: "用于App真机调试、签名、分发应用到App Store", icon: "person.badge.shield.checkmark", viewName: AnyView(TutorialDeveloperAccount()))
]

struct TutorialFirst: View {
    var body: some View {
        ScrollView {
            NavigationLink(destination: {
                loadLocalHtmlForMarkdown()
            }, label: {
                Text("条案")
                    .font(.title)
            })
            VStack {
                ForEach(startList, id: \.id) {item in
                    NavigationLink(destination: item.viewName, label: {
                        shapeStyleForFirst(sn: item.sn, title: item.title, desc: item.desc, icon: item.icon)
                    })
                }
                
                Spacer()
            }
            .navigationTitle("初见")
            .navigationBarTitleDisplayMode(.inline)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.init(uiColor: UIColor(hexString: "#F2F2F6")))
    }
}

struct shapeStyleForFirst: View {
    @State var sn: String = ""
    @State var title: String = ""
    @State var desc: String = ""
    @State var icon: String = ""
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                Circle()
                    .fill(.white)
                    .frame(width: 30, height: 30)
                    .overlay(Text(sn))
            }
            .frame(width: 50)
            
            VStack(alignment: .leading) {
                Text(title)
                
                Label(desc, systemImage: "")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(EdgeInsets(top: 2, leading: -7, bottom: 3, trailing: 0))
                    .lineLimit(2)
                
                Divider()
            }
        }
        .frame(height:80)
        .foregroundColor(.black)
    }
}

struct TutorialFirst_Previews: PreviewProvider {
    static var previews: some View {
        TutorialFirst()
    }
}
