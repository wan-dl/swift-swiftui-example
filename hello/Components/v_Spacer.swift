//
//  v_Spacer.swift
//  format
//
//  Created by 1 on 7/29/22.
//

import SwiftUI

let test1: String = """
HStack {
    Image(systemName: "checkmark")
    Spacer()
    Text("Test")
}
"""

struct v_Spacer: View {
    
    var body: some View {
        VStack(alignment: .center) {
            
            Text("Spacer用法和示例")
                .font(.title)
            
            Divider()
            
            Section() {
                
                VStack(alignment: .leading) {
                    Text(test1)
                        .font(.body)
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .background(.gray.opacity(0.2))
                
                HStack {
                    Image(systemName: "checkmark")
                    Spacer()
                    Text("Test")
                }
                .border(.green.opacity(0.3))
                .padding(.vertical, 50)
            }
        }
        .padding()
    }
}

struct v_Spacer_Previews: PreviewProvider {
    static var previews: some View {
        v_Spacer()
    }
}
