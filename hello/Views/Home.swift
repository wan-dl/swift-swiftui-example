//
//  Home.swift
//  HelloSwift
//
//  Created by 1 on 9/7/22.
//

import SwiftUI

struct elment: Identifiable {
    let id = UUID()
    var docId: String
    var title: String
    var desc: String
    var icon: String
    var iconColor: Color
    var viewName: AnyView
}

var tutorialList: [elment] = [
    elment(docId: "firstSight", title: "初见", desc: "希望每一个 “Hello, World!” 之后都能开启一段圆满", icon: "face.smiling", iconColor: .red, viewName: AnyView(TutorialFirst())),
    elment(docId: "SwiftUI", title: "SwiftUI 教程", desc: "Tutorial for SwiftUI", icon: "icon_swiftui", iconColor: .indigo, viewName: AnyView(SwiftUIComponentsView())),
    elment(docId: "Swift", title: "Swift 官方教程中文版", desc: "The Swift Programming Language", icon: "icon_swift",  iconColor: .orange, viewName: AnyView(TutorialSwiftSimple())),
    elment(docId: "Framework", title: "常用库使用示例", desc: "Tutorial for iOS Framework", icon: "icon_sdk",  iconColor: .black, viewName: AnyView(API()))
]

struct Home: View {
    
    var body: some View {
        ScrollView {
            HStack {
                Label("", systemImage: "bookmark")
                    .font(.title3)
                    .foregroundColor(.red)
                
                Text("更多示例和源码，请从AppStore下载 极简开发App。点击下载")
                    .font(.callout)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding()
            .onTapGesture {
                gotoStore()
            }
            
            VStack(alignment: .leading) {
                Group {
                    ForEach(tutorialList) { item in
                        NavigationLink(destination: {
                            item.viewName
                        }, label: {
                            shapeStyleForTutorial(icon: item.icon, iconColor: item.iconColor, title: item.title, desc: item.desc)
                        })
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarItems(
                trailing:
                    NavigationLink(destination: {
                        About()
                    }, label: {
                        Label("", systemImage: "ellipsis")
                            .labelStyle(.iconOnly)
                    })
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.init(uiColor: UIColor(hexString: "#F2F2F6")))
        .navigationTitle("探索")
        .navigationBarTitleDisplayMode(.large)
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 88)
        })
    }
    
    func gotoStore() {
        let url = URL(string: "itms-apps://itunes.apple.com/cn/app/id1643821819")!
        
        if !UIApplication.shared.canOpenURL(url) {
             return
        }
        
        UIApplication.shared.open(url) { (success) in
            print("跳转状态: \(success)")
        }
    }
}

struct shapeStyleForTutorial: View {
    @State var icon: String = ""
    @State var iconColor: Color
    @State var title: String = ""
    @State var desc: String = ""
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                if icon == "face.smiling" {
                    Image(systemName: icon)
                        .symbolRenderingMode(.multicolor)
                        .font(.title.weight(.light))
                        .foregroundColor(iconColor)
                } else {
                    Image(icon)
                        .resizable(resizingMode: .stretch)
                        .frame(width: 35, height: 35)
                        .offset(x: 5)
                }
                
            }
            .frame(width: 55, height: 110, alignment: .center)
            
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.black)
                
                Label(desc, systemImage: "")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .padding(.leading, -8)
            }
            
            Spacer()
        }
        .frame(height: 110)
        .background(.white)
        .cornerRadius(10)
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
