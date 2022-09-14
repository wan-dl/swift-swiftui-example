//
//  v_OutlineGroup.swift
//  format
//
//  Created by 1 on 7/28/22.
//

import SwiftUI

struct FileItem: Hashable, Identifiable, CustomStringConvertible {
    var id: Self { self }
    var name: String
    var children: [FileItem]? = nil
    var description: String {
        switch children {
        case nil:
            return "📄 \(name)"
        case .some(let children):
            return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
        }
    }
}

struct v_OutlineGroup: View {
    
    let data =
      FileItem(name: "users", children:
        [FileItem(name: "user1234", children:
          [FileItem(name: "Photos", children:
            [FileItem(name: "photo001.jpg"),
             FileItem(name: "photo002.jpg")]),
           FileItem(name: "Movies", children:
             [FileItem(name: "movie001.mp4")]),
              FileItem(name: "Documents", children: [])
          ]),
         FileItem(name: "newuser", children:
           [FileItem(name: "Documents", children: [])
           ])
        ])
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if #available(iOS 14.0, *) {
                OutlineGroup(data, children: \.children) { item in
                    Text("\(item.description)")
                }
                .padding()
            } else {
                Text("OutlineGroup方法，仅支持iOS 14.0+")
            }
        }
        .navigationTitle("OutlineGroup")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "OutlineGroup"))
    }
}

struct v_OutlineGroup_Previews: PreviewProvider {
    static var previews: some View {
        v_OutlineGroup()
    }
}
