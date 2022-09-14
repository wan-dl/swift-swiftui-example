//
//  v_Dialog.swift
//  format
//
//  Created by 1 on 7/30/22.
//

import SwiftUI

@available (iOS 15.0, *)
struct v_confirmationDialog: View {
    @State var isShowDialog: Bool = false
    
    var body: some View {
        VStack {
            Text("简介：confirmationDialog, 仅适用于 iOS 15.0+")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
            
            Button("是否删除？") {
                self.isShowDialog = true
            }
            .confirmationDialog( "是否删除？", isPresented: $isShowDialog ) {
                Button("确认", role: .destructive) {}
                Button("取消", role: .cancel) {}
            }
        }
        .padding()
        .navigationTitle("confirmationDialog")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "confirmationDialog"))
    }
}

struct v_confirmationDialog_Previews: PreviewProvider {
    static var previews: some View {
        v_confirmationDialog()
    }
}
