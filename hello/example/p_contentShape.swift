//
//  p_contentShape.swift
//  HelloSwift
//
//  Created by 1 on 9/4/22.
//  控制台视图点击区域

import SwiftUI

struct p_contentShape: View {
    var body: some View {
        VStack {
            
            VStack {
                Image(systemName: "person.circle").resizable().frame(width: 50, height: 50)
                Spacer().frame(height: 50)
                Text("Paul Hudson")
            }
            .contentShape(Rectangle())
            .onTapGesture {
                print("Show details for user")
            }
            
            Text("简介：本页面示例，使用了.contentShape()方法。")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
                .offset(y: 50)
        }
        .padding()
        .navigationTitle("contentShape")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct p_contentShape_Previews: PreviewProvider {
    static var previews: some View {
        p_contentShape()
    }
}
