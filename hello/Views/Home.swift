//
//  Home.swift
//  HelloSwift
//
//  Created by hx on 9/7/22.
//

import SwiftUI

struct elment: Identifiable {
    let id = UUID()
    var desc: String
    var icon: String
}

var startList: [elment] = [
    elment(desc: "简介", icon: ""),
    elment(desc: "新建项目", icon: ""),
    elment(desc: "申请\n开发者账号", icon: ""),
    elment(desc: "JavaScript", icon: "")
]

var tutorialList: [elment] = [
    elment(desc: "Swift语言\n官方教程中文版", icon: "icon_swift"),
    elment(desc: "SwiftUI\n构建用户界面", icon: "icon_swiftui"),
    elment(desc: "iOS\nFramework", icon: "icon_sdk")
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
            .frame(maxWidth: .infinity)
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
                        VStack(alignment: .center){
                            Image(item.icon)
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                                .frame(width: 28, height: 28)
                                .offset(y: 10)
                            Text(item.desc)
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .frame(height: 50)
                                .frame(maxWidth:.infinity)
                                .padding()
                        }
                        .frame(width: 110, height: 110, alignment: .bottomLeading)
                        .background(.white)
                        .cornerRadius(10)
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
                        API()
                    }, label: {
                        VStack(alignment: .center){
                            Image(item.icon)
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                                .frame(width: 64, height: 64)
                                .offset(y: 10)
                            Text(item.desc)
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .frame(height: 50)
                                .frame(maxWidth:.infinity)
                                .padding()
                        }
                        .frame(width: 150, height: 180, alignment: .bottomLeading)
                        .background(.white)
                        .cornerRadius(10)
                    })
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
