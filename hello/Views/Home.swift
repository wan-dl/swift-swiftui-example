//
//  p_home.swift
//  HelloSwift
//
//  Created by 1 on 7/30/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView() {
            card            
//            Color.clear.frame(height: 1000)
        }
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay(
            NavigationBar(title: "Hello")
        )
        .padding(.horizontal, -10)
//        .navigationTitle("Hello")
//        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
    
    var card: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image("Logo 2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 36,height: 36)
                .cornerRadius(20)
            Text("SwiftUI For iOS")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    .linearGradient(
                        colors: [.primary, .primary.opacity(0.5)],
                        startPoint: .topLeading,
                        endPoint: .bottomLeading
                    )
                )
                
            Text("使用更少的代码创建更好的应用")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
            Text("SwiftUI是一种使用Swift语言在苹果设备上构建用户界面的创新且简单的方式...")
                .font(.footnote)
                .foregroundColor(.secondary)
                .lineLimit(2)
                .offset(y: 10)
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20)
        .frame(height: 350.0)
        .background(.ultraThinMaterial)
        .cornerRadius(30.0)
        .shadow(radius: 10, x: 0, y: 10)
        .padding(.horizontal, 20)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
        )
        .overlay(
            Image("Illustration 5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
                .offset(x: 32, y: -80)
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
