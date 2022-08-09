//
//  v_Dialog.swift
//  format
//
//  Created by 1 on 7/30/22.
//

import SwiftUI

struct v_Dialog: View {
    @State var isShowDialog: Bool = false
    
    var body: some View {
        VStack {
            Button("Show Dialog") {
                self.isShowDialog.toggle()
            }
            .confirmationDialog("", isPresented: $isShowDialog) {
                HStack {
                    Text("这是一个Dialog")
                }
            }
        }
        .navigationBarTitle("Dialog", displayMode: .inline)
    }
}

struct v_Dialog_Previews: PreviewProvider {
    static var previews: some View {
        v_Dialog()
    }
}
