//
//  styles.swift
//  HelloSwift
//
//  Created by 1 on 8/5/22.
//

import SwiftUI

struct PrimaryBtnStyle: ButtonStyle {
    @State var bgColor = Color.blue
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(bgColor)
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}


struct RadioButton: View {
    let id: String
    let selectedID: String
    let callBack: (String) -> ()
    
    init(id: String, selectedID: String, callBack: @escaping (String) -> ()){
        self.id = id
        self.selectedID = selectedID
        self.callBack = callBack
    }
    
    var body: some View {
        Button(action: {
            self.callBack(self.id)
        }, label: {
            HStack(alignment: .center, spacing: 12, content: {
                Image(systemName: self.selectedID == self.id ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(self.selectedID == self.id ? Color.blue : Color.black)
                Text(self.id)
                    .foregroundColor(Color.black)
            })
        })
    }
}

