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
    var desc: String
    var icon: String
}

var startList: [elment] = [
    elment(docId: "introduce", desc: "简介", icon: "doc.viewfinder"),
    elment(docId: "CreateProject", desc: "新建项目", icon: "plus.square"),
    elment(docId: "Account", desc: "开发者账号", icon: "person.badge.shield.checkmark")
]

var tutorialList: [elment] = [
    elment(docId: "Swift", desc: "Swift语言\n官方教程中文版", icon: "icon_swift"),
    elment(docId: "SwiftUI", desc: "SwiftUI\n构建用户界面", icon: "icon_swiftui"),
    elment(docId: "Framework", desc: "iOS\nFramework", icon: "icon_sdk")
]

struct Home: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Group {
                    Text("开始")
                        .font(.title)
                    startView
                }
                
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
        .background(.gray.opacity(0.1))
        .navigationTitle("Swift")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 44)
        })
    }
    
    var startView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(startList) { item in
                    NavigationLink(destination: {
                        API()
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
                            default:
                                API()
                        }
                    }, label: {
                        HomeBlockUI_2(icon: item.icon, desc: item.desc)
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
    @State var desc: String = ""
    
    var body: some View {
        VStack(alignment: .center){
            Image(icon)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(width: 64, height: 64)
                .offset(y: 10)
            Text(desc)
                .font(.footnote)
                .frame(height: 50)
                .frame(maxWidth:.infinity)
                .padding()
        }
        .frame(width: 150, height: 180, alignment: .bottomLeading)
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
