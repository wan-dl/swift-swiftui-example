//
//  InputSecureField.swift
//  HelloSwift
//
//  Created by 1 on 9/4/22.
//

import SwiftUI

struct InputSecureField: View {
    @State var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("简介：本页面示例，主要用到了SecureField()")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
            
            Section(header: Text("密码输入框 SecureField").padding(.horizontal, 5)) {
                SecureField("密码输入框", text: $password)
                    .textContentType(.password)
                    .textFieldStyle(.roundedBorder)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("SecureField")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InputSecureField_Previews: PreviewProvider {
    static var previews: some View {
        InputSecureField()
    }
}
