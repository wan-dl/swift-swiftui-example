//
//  v_extensionView.swift
//  HelloSwift
//
//  Created by 1 on 9/24/22.
//

import SwiftUI

extension Button where Label == Image {
    init(iconName: String, action: @escaping () -> Void) {
        self.init(action: action) {
            Image(systemName: iconName)
        }
    }
}

extension View {
    func largeButton() -> some View {
        self
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .backgroundColor(.blue)
            .cornerRadius(10)
            .foregroundColor(.white)
            .padding()
    }
}

struct v_extensionView: View {
    
    @State var isShowToast: Bool = false
    @State var isShowSuccess: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            Text("本页面的Button, 都用到了extension协议，具体请点击右上角查看源码。")
                .foregroundColor(.gray)
                .font(.callout)
                .frame(height: 120)
                .padding()
            
            // 示例1
            Button(iconName: "paperplane", action: { })
            
            // 示例2
            Button("提交", action: { })
                .largeButton()
            
            Spacer()
        }
        .navigationTitle("extension View")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "extensionView"))
    }
}


struct v_extensionView_Previews: PreviewProvider {
    static var previews: some View {
        v_extensionView()
    }
}
