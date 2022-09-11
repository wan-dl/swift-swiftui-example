//
//  Home.swift
//  HelloSwift
//
//  Created by hx on 9/7/22.
//

import SwiftUI

struct elment: Identifiable {
    let id = UUID()
    var docId: String
    var title: String
    var desc: String
    var icon: String
}

var startList: [elment] = [
    elment(docId: "introduce", title: "", desc: "入门", icon: "doc.viewfinder"),
    elment(docId: "CreateProject", title: "", desc: "新建项目", icon: "plus.square"),
    elment(docId: "Account", title: "", desc: "开发者账号", icon: "person.badge.shield.checkmark")
]

var tutorialList: [elment] = [
    elment(docId: "Swift", title: "Swift语言", desc: "官方教程中文版", icon: "icon_swift"),
    elment(docId: "SwiftUI", title: "SwiftUI", desc: "构建用户界面", icon: "icon_swiftui"),
    elment(docId: "Framework", title: "iOS", desc: "Framework", icon: "icon_sdk")
]

struct Home: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                startView
                
                Group {
                    Text("进阶")
                        .font(.title2)
                    tutorialView
                }
                .offset(y: 40)
                
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.init(uiColor: UIColor(hexString: "#F2F2F6")))
        .navigationTitle("探索")
        .navigationBarTitleDisplayMode(.large)
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 44)
        })
    }
    
    var startView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(startList) { item in
                    NavigationLink(destination: {
                        switch item.docId {
                        case "introduce":
                            TutorialIntroduction()
                        case "CreateProject":
                            TutorialCreateProject()
                        case "Account":
                            TutorialDeveloperAccount()
                        default:
                            GlobalSearch()
                        }
                    }, label: {
                        HomeBlockUI_1(icon: item.icon, desc: item.desc)
                    })
                }
            }
        }
    }
    
    var tutorialView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                ForEach(tutorialList) { item in
                    NavigationLink(destination: {
                        switch item.docId {
                        case "Swift":
                            TutorialSwiftLanguage()
                        case "SwiftUI":
                            TutorialSwiftUI()
                        case "Framework":
                            TutorialFramework()
                        default:
                            GlobalSearch()
                        }
                    }, label: {
                        HomeBlockUI_2(icon: item.icon, title: item.title, desc: item.desc)
                    })
                }
            }
        }
    }
}

struct HomeBlockUI_1: View {
    @State var icon: String = ""
    @State var desc: String = ""
    
    var body: some View {
        VStack(alignment: .center){
            Image(systemName: icon)
                .foregroundColor(.black.opacity(0.8))
                .font(.system(size: 22))
                .frame(width: 35, height: 28)
                .offset(y: 10)
            Text(desc)
                .font(.footnote)
                .frame(height: 40)
                .frame(maxWidth:.infinity)
        }
        .padding()
        .frame(width: 110, height: 110, alignment: .bottomLeading)
        .background(.white)
        .foregroundColor(.black)
        .cornerRadius(10)
    }
}

struct HomeBlockUI_2: View {
    @State var icon: String = ""
    @State var title: String = ""
    @State var desc: String = ""
    
    var body: some View {
        HStack(alignment: .center) {
            Image(icon)
                .resizable(resizingMode: .stretch)
                .frame(width: 40, height: 40)
                .offset(x: 15)
            VStack(alignment: .leading) {
                Text(title)
                Text(desc)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .frame(width: 140)
        }
        .frame(width: 180, height: 110)
        .background(.white)
        .foregroundColor(.black)
        .cornerRadius(10)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
