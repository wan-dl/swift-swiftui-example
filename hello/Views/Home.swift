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
    var viewName: AnyView
}

var tutorialList: [elment] = [
    elment(docId: "firstSight", title: "初见", desc: "希望每一个 “Hello, World!” 之后都能开启一段圆满", icon: "firstSight", viewName: AnyView(TutorialFirst())),
    elment(docId: "SwiftUI", title: "SwiftUI教程", desc: "Tutorial for SwiftUI", icon: "icon_swiftui", viewName: AnyView(SwiftUIComponentsView())),
    elment(docId: "Swift", title: "Swift 官方教程中文版", desc: "The Swift Programming Language", icon: "icon_swift", viewName: AnyView(TutorialSwiftLanguage())),
    elment(docId: "Framework", title: "常用库使用示例", desc: "Tutorial for iOS Framework", icon: "icon_sdk", viewName: AnyView(API()))
]

struct Home: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Group {
                    ForEach(tutorialList) { item in
                        NavigationLink(destination: {
                            item.viewName
                        }, label: {
                            shapeStyleForTutorial(icon: item.icon, title: item.title, desc: item.desc)
                        })
                    }
                }
                .padding(.horizontal)
                .offset(y: 20)
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
        .navigationTitle("学习")
        .navigationBarTitleDisplayMode(.large)
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 88)
        })
    }
}

struct shapeStyleForTutorial: View {
    @State var icon: String = ""
    @State var title: String = ""
    @State var desc: String = ""
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                if icon == "firstSight" {
                    Image(systemName: "swift")
                        .symbolRenderingMode(.multicolor)
                        .font(.title)
                        .foregroundColor(.black)
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
