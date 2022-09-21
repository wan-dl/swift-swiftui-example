//
//  v_navigationBarItems.swift
//  HelloSwift
//
//  Created by 1 on 9/20/22.
//

import SwiftUI

@available (iOS, introduced: 13.0, deprecated: 16.0, message: "此方法仅仅适用于13.0~16.0, iOS 16.0之后，推荐使用 .toolbar()")
struct v_navigationBarItems: View {
    
    // dismiss方法 适用于 iOS 15.0+
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("请注意，顶部导航栏左边和右边按钮。\n本示例用到了 .navigationBarItems() 方法。\n此方法适用于iOS 13.0-16.0, iOS 16.0之后，推荐使用 .toolbar() ")
                .font(.callout)
                .foregroundColor(.gray)
                .padding()
                .modifier(buttonViewCodeAndDocs(pageType: "SwiftUI",pageID: "navigationBarItems"))
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: {
                self.dismiss()
            }) {
                Text("< 返回")
            },
            trailing: Button(action: {
                
            }) {
                Text("分享")
            }
        )
    }
}

struct v_navigationBarItems_Previews: PreviewProvider {
    static var previews: some View {
        v_navigationBarItems()
    }
}
