//
//  p_StatusBarBackgroundOnScroll.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI

struct p_StatusBarBackgroundOnScroll: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//import SwiftUI
//import SwiftUITrackableScrollView
//
//struct p_StatusBarBackgroundOnScroll: View {
//    @State private var scrollViewContentOffset: CGFloat = .zero
//
//    var body: some View {
//        ZStack(alignment: .top) {
//            Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).edgesIgnoringSafeArea(.all)
//
//            TrackableScrollView(.vertical, showIndicators: true, contentOffset: $scrollViewContentOffset) {
//                Text("Hello world!")
//                    .padding()
//            }
//
//            Rectangle()
//                .foregroundColor(.white)
//                .opacity(scrollViewContentOffset > 16 ? 1 : 0)
//                .animation(.easeIn)
//                .ignoresSafeArea()
//                .frame(height: 0)
//        }
//    }
//}

struct p_StatusBarBackgroundOnScroll_Previews: PreviewProvider {
    static var previews: some View {
        p_StatusBarBackgroundOnScroll()
    }
}
