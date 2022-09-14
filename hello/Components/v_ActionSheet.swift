//
//  ViewActionSheet.swift
//  format
//
//  Created by 1 on 7/29/22.
//

import SwiftUI

struct v_ActionSheet: View {
    @State private var showActionSheet: Bool = false
    
    var body: some View {
        
        VStack {
            Text("简介：actionSheet iOS 13.0–16.0 Deprecated。iOS 15.0+，建议使用confirmationDialog")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
            
            Button("点击显示 actionSheet") {
                showActionSheet = true
            }
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(
                    title: Text("请选择操作"),
                    message: Text("xxxxxxxxxxx"),
                    buttons: [
                        .cancel(
                            Text("取消")
                        ),
                        .default(
                            Text("确认")
                        )
                    ]
                )
            }
        }
        .padding()
        .navigationTitle("ActionSheet")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "ActionSheet"))
    }
}

struct v_ActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        v_ActionSheet()
    }
}
