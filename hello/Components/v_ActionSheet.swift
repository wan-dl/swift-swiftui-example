//
//  ViewActionSheet.swift
//  format
//
//  Created by hx on 7/29/22.
//

import SwiftUI

struct v_ActionSheet: View {
    @State private var showActionSheet: Bool = false
    
    var body: some View {
        
        VStack {
            Button("Tap to show action sheel") {
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
        .navigationBarTitle(Text("ActionSheet"), displayMode: .inline)
    }
}

struct v_ActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        v_ActionSheet()
    }
}
