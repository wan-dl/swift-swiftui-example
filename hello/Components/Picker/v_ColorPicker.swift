//
//  v_ColorPicker.swift 颜色选择器
//  HelloSwift
//
//  Created by 1 on 9/5/22.
//

import SwiftUI

struct v_ColorPicker: View {
    @State private var bgColor = Color.blue.opacity(0.5)
        
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 120, height: 120)
                    .foregroundColor(bgColor)
                    .padding(.horizontal)
            }
            
            ColorPicker("请选择区域背景色", selection: $bgColor)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("ColorPicker")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct v_ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        v_ColorPicker()
    }
}
