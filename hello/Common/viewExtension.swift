//
//  viewExtension.swift
//  HelloSwift
//
//  Created by hx on 9/13/22.
//

import SwiftUI

extension View {
    func backgroundColor(_ color: Color) -> some View {
        return self.background(color)
    }
}

extension View {
    func textCallout() -> some View {
        return
        self.font(.callout)
            .foregroundColor(.gray)
    }
}

extension View {
    func navBarViewSource_View(_ name: String) -> some View {
        return

        self.navigationBarItems(
            trailing:
                Menu {
                    Button(action: {
                        
                    }, label: {
                        Label("查看源码", systemImage: "text.viewfinder")
                    })
                    Button(action: {

                    }, label: {
                        Label("查看文档", systemImage: "doc.viewfinder")
                    })
                } label: {
                    Label("Menu示例", systemImage: "ellipsis.circle")
                        .labelStyle(.iconOnly)
                }
        )
    }
}

