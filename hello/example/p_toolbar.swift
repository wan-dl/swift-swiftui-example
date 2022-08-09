//
//  v_toolbar.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI

struct v_toolbar: View {
    var body: some View {
        VStack {
            Text("My app")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Image(systemName: "person")
                    HStack {
                        Image(systemName: "ellipsis")
                        Divider()
                        Image(systemName: "trash")
                            .frame(width: 32, height: 32)
                            .background(Color.blue)
                            .mask(Circle())
                    }
                }
            }
        }
    }
}

struct v_toolbar_Previews: PreviewProvider {
    static var previews: some View {
        v_toolbar()
    }
}
