//
//  ViewScrollViewReader.swift
//  format
//
//  Created by 1 on 7/29/22.
//

import SwiftUI

struct v_ScrollViewReader: View {
    @Namespace var topID
    @Namespace var bottomID
    let desc: String = "滚动视图阅读器的内容视图构建器接收Scroll实例；您使用代理的执行滚动。"
    
    var body: some View {
        VStack {
            Text(desc)
                .font(.body)
                
            
            ScrollViewReader { proxy in
                ScrollView {
                    Button("点此滚动到底部") {
                        withAnimation {
                            proxy.scrollTo(bottomID)
                        }
                    }
                    .id(topID)

                    VStack(spacing: 0) {
                        ForEach(0..<100) { i in
                            color(fraction: Double(i) / 100)
                                .frame(height: 32)
                        }
                    }

                    Button("点此滚动到顶部") {
                        withAnimation {
                            proxy.scrollTo(topID)
                        }
                    }
                    .id(bottomID)
                }
            }
        }
        .padding()
        .navigationBarTitle(Text("ScrollViewReader"), displayMode: .inline)
    }

    func color(fraction: Double) -> Color {
        Color(red: fraction, green: 1 - fraction, blue: 0.5)
    }
}

struct v_ScrollViewReader_Previews: PreviewProvider {
    static var previews: some View {
        v_ScrollViewReader()
    }
}
