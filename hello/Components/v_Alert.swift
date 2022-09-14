//
//  ViewAlert.swift
//  format
//
//  Created by 1 on 7/29/22.
//

import SwiftUI

struct v_Alert: View {
    @State var showingAlert1: Bool = false
    @State var showingAlert2: Bool = false
    
    var body: some View {
        
        VStack(spacing: 100) {
            
            // 样式1
            Button("Alert 弹窗样式1", action: {
                self.showingAlert1 = true
            }).alert(isPresented: $showingAlert1) {
                Alert(
                    title: Text("标题1"),
                    message: Text("这是消息内容"),
                    dismissButton: .default(Text("OK"))
                )
            }
            
            
            // 样式2
            Button("Alert 弹窗样式2", action: {
                self.showingAlert2 = true
            }).alert(isPresented: $showingAlert2) {
                Alert(
                    title: Text("标题2"),
                    message: Text("这是消息内容"),
                    primaryButton: .default(Text("确定")),
                    secondaryButton: .destructive(Text("取消"))
                )
            }
        }
        .navigationBarTitle("Alert")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Alert"))
    }
}

struct v_Alert_Previews: PreviewProvider {
    static var previews: some View {
        v_Alert()
    }
}
