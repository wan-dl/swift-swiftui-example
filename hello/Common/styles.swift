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
