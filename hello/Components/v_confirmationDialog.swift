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
            Button("Empty Trash") {
                self.isShowDialog = true
            }
            .confirmationDialog(
                "Permanently erase the items in the Trash?",
                isPresented: $isShowDialog
            ) {
                Button("Empty Trash", role: .destructive) {
                    
                }
            }
        }
        .navigationTitle("confirmationDialog")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct v_confirmationDialog_Previews: PreviewProvider {
    static var previews: some View {
        v_confirmationDialog()
    }
}
