//
//  p_markdownWithAttributedString.swift
//  HelloSwift
//
//  Created by hx on 8/3/22.
//

import SwiftUI
//import lnk
struct p_markdownWithAttributedString: View {
    @State var mdData: AttributedString = ""
    let markdown = """
```javascript
let abc = "xxx"
```
Visit [Design Code](https://designcode.io) to learn how to `code` and _design_.
"""
    
    var body: some View {
        VStack() {
            Text(mdData)
                .onAppear() {
                    do {
                        mdData = try AttributedString(markdown: markdown)
                    } catch {
                        print("Error creating AttributedString:  \(error)")
                    }
                }
                .padding()
                .frame(height: 300)
                .background(.gray.opacity(0.2))
                .foregroundColor(.black)
                .font(.body)
        }
        .navigationBarTitle("MarkDown渲染", displayMode: .inline)
    }
}

struct p_markdownWithAttributedString_Previews: PreviewProvider {
    static var previews: some View {
        p_markdownWithAttributedString()
    }
}
