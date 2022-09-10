//
//  Show_SwiftUI_Docs.swift
//  HelloSwift
//
//  Created by 1 on 9/10/22.
//

import SwiftUI

struct Show_SwiftUI_Docs: View {
    @State var available_versions: [String] = []
    @State var desc: String = ""
    @State var declaration: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(available_versions[0])
                .font(.callout)
                .padding(.horizontal, 10)
                .foregroundColor(.gray)
                .overlay(
                    Capsule(style: .continuous)
                        .stroke(.gray, lineWidth: 1)
                )
                
            Text(desc)
                .font(.callout)
            
            Group {
                Text(declaration)
                    .font(.callout)
                    .foregroundColor(.black.opacity(0.8))
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(10)
            }
            .background(.regularMaterial)
            .cornerRadius(10)
        }
        .padding()
    }
}

struct Show_SwiftUI_Docs_Previews: PreviewProvider {
    static var previews: some View {
        Show_SwiftUI_Docs()
    }
}
