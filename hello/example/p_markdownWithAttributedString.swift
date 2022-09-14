//
//  p_markdownWithAttributedString.swift
//  HelloSwift
//
//  Created by 1 on 8/3/22.
//

import SwiftUI
//import lnk
struct p_markdownWithAttributedString: View {
    @State var mdData: AttributedString = ""
    let markdown = """
```javascript
let abc = "xxx"
```
访问 [Baidu](https://www.baidu.com) 搜索
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
        .navigationTitle("MarkDown渲染")
    }
}

struct p_markdownWithAttributedString_Previews: PreviewProvider {
    static var previews: some View {
        p_markdownWithAttributedString()
    }
}
