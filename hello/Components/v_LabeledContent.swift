//
//  v_LabeledContent.swift
//  HelloSwift
//
//  Created by 1 on 9/10/22.
//

import SwiftUI

struct v_LabeledContent: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("LabeledContent, 仅适用于iOS 16.0+。示例效果如下：")
                .font(.footnote)
                .padding()
            
            if #available(iOS 16.0, *) {
                exampleForLabeledContent
            }
            
            Spacer()
        }
        .navigationTitle("LabeledContent")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "LabeledContent"))

    }
    
    @available (iOS 16.0, *)
    var exampleForLabeledContent: some View {
        Form {
            // 示例1
            LabeledContent("Label", value: "Content")
            
            // 示例2
            LabeledContent {
                EmptyView()
            } label: {
                Text("Custom Value")
            }
            
            // 示例3
            LabeledContent("Number", value: 100.0, format: .number.precision(.fractionLength(0)) )
        }
        .frame(height: 200)
    }
}

struct v_LabeledContent_Previews: PreviewProvider {
    static var previews: some View {
        v_LabeledContent()
    }
}
