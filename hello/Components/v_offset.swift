//
//  v_offset.swift
//  HelloSwift
//
//  Created by 1 on 9/23/22.
//

import SwiftUI

struct v_offset: View {
    var body: some View {
        VStack {
            Text("如下示例，中间圆，设置了x和y的偏移量为25。但是视图的原始尺寸没有因为设置offset发生更改，仅会影响子视图，换而言之，offset不会影响布局。")
                .font(.callout)
                .foregroundColor(.gray)
                .padding(20)
            
            HStack {
                Circle().fill(Color.red)
                Circle().fill(Color.green).offset(x: 25.0, y: 25.0)
                Circle().fill(Color.yellow)
            }
            .frame(width: 210, height: 66)
            .border(Color.black)
        }
        .navigationTitle(".offset()")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "offset"))
    }
}

struct v_offset_Previews: PreviewProvider {
    static var previews: some View {
        v_offset()
    }
}
