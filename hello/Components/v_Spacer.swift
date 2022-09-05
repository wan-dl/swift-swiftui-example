//
//  v_Spacer.swift
//  format
//
//  Created by 1 on 7/29/22.
//

import SwiftUI

let testCode: String = """
HStack {
    Image(systemName: "checkmark")
    Spacer()
    Text("Test")
}
"""

struct v_Spacer: View {
    
    var body: some View {
        VStack(alignment: .center) {
            
            Text("Spacer()示例代码")
                .font(.title)
            
            VStack(alignment: .leading) {
                Text(testCode)
                    .font(.body)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .background(.gray.opacity(0.1))
            
            Text("示例代码效果")
                .font(.title)
                .offset(y: 50)
            
            HStack {
                Image(systemName: "checkmark")
                Spacer()
                Text("Test")
            }
            .border(.gray.opacity(0.1))
            .padding(.vertical, 50)
            
        }
        .padding()
        .navigationTitle("Spacer()")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct v_Spacer_Previews: PreviewProvider {
    static var previews: some View {
        v_Spacer()
    }
}
