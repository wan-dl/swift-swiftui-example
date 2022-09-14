//
//  v_TimelineView.swift
//  format
//
//  Created by 1 on 7/28/22.
//

import SwiftUI

@available (iOS 15.0, *)
struct v_TimelineView: View {
    var body: some View {
        VStack {
            Section() {
                Text("简介").font(.title)
                Text("TimelineView 是一种 SwiftUI 视图类型，可根据提供的时间表更新其正文。")
                    .font(.caption)
            }
            .padding()
            
            Text("一个动画圆圈一分钟的快速示例")
                .font(.title3)
                .padding()
            
            TimelineView(.animation) { context in
                let value = secondsValue(for: context.date)

                Circle()
                    .trim(from: 0, to: value)
                    .stroke()
            }
        }
        .navigationTitle("TimelineView")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "TimelineView"))
   }

   private func secondsValue(for date: Date) -> Double {
       let seconds = Calendar.current.component(.second, from: date)
       return Double(seconds) / 60
   }
}

struct v_TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        v_TimelineView()
    }
}
