//
//  p_modal.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI

struct p_modal: View {
    @State var isShowModal: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.isShowModal.toggle()
            }, label: {
                Text("显示Modal")
            })
            
            if isShowModal {
                openModal
            }
        }
    }
    
    var openModal: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.blue.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isShowModal = false
                }
            
//            v_Text()
        }
        .frame(height: 200)
    }
}

struct p_modal_Previews: PreviewProvider {
    static var previews: some View {
        p_modal()
    }
}
