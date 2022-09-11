//
//  v_contextMenu.swift
//  HelloSwift
//
//  Created by 1 on 9/11/22.
//

import SwiftUI

struct v_contextMenu: View {
    var body: some View {
        VStack {
            Text("contextMenu示例")
                .font(.title3)
                .padding()
                .contextMenu {
                    Button("♥️ - Hearts", action: {})
                    Button("♣️ - Clubs", action: {})
                    Button("♠️ - Spades", action: {})
                    Button("♦️ - Diamonds", action: {})
                }
        }
        .navigationTitle("contextMenu")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct v_contextMenu_Previews: PreviewProvider {
    static var previews: some View {
        v_contextMenu()
    }
}
