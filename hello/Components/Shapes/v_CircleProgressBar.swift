//
//  v_CircleProgressBar.swift
//  HelloSwift
//
//  Created by 1 on 9/24/22.
//

import SwiftUI

struct v_CircleProgressBar: View {
    @State var progress: Double = 0.6666
    
    var body: some View {
        VStack {
            Text("圆形进度条")
                .frame(height: 100)
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(Color.red)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.red)
                    .rotationEffect(Angle(degrees: 270.0))
                    //.animation(.linear)
                
                Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                    .font(.largeTitle)
                    .bold()
            }
            .frame(width: 200, height: 200)
            .navigationTitle("CircleProgressBar")
            .navigationBarTitleDisplayMode(.inline)
            .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "CircleProgressBar"))
        }
        
    }
}

struct v_CircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        v_CircleProgressBar()
    }
}
