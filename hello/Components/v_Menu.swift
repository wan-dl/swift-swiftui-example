//
//  v_Menu.swift
//  format
//
//  Created by 1 on 7/24/22.
//

import SwiftUI

struct v_Menu: View {
    var body: some View {
        VStack {
            
            Menu {
                Button(action: addCurrentTabToReadingList) {
                    Label("添加列表", systemImage: "eyeglasses")
                }
                Button(action: bookmarkAll) {
                    Label("添加书签", systemImage: "book")
                }
                Button(action: show) {
                    Label("显示所有书签", systemImage: "books.vertical")
                }
                Menu("二级菜单") {
                    Button("Share", action: share)
                }
            } label: {
                Label("书签管理", systemImage: "book")
            } primaryAction: {
                addBookmark()
            }
            .font(.title)
            
            Text("操作：长按以上内容，即可看到菜单列表")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(EdgeInsets(top: 50, leading: 10, bottom: 0, trailing: 10))
            
            
        }
        .navigationBarTitle(Text("Menu"), displayMode: .inline)
    }
        
    
    func addCurrentTabToReadingList() {}
    
    func addBookmark() {}
    
    func bookmarkAll() {}
    
    func show() {}
    
    func share() {}
}

struct v_Menu_Previews: PreviewProvider {
    static var previews: some View {
        v_Menu()
    }
}
