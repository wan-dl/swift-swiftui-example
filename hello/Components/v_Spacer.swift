//
//  v_Spacer.swift
//  format
//
//  Created by 1 on 7/29/22.
//

import SwiftUI

struct v_Spacer: View {
    
    var body: some View {
        VStack {
            
            Text("Spacer()效果")
                .font(.callout)
            
            HStack {
                Image(systemName: "checkmark")
                Spacer()
                Text("Test")
            }
            .border(.gray.opacity(0.1))
            .padding(.vertical, 50)
            
        }
        .navigationTitle("Spacer()")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Spacer"))
    }
}

struct v_Spacer_Previews: PreviewProvider {
    static var previews: some View {
        v_Spacer()
    }
}
