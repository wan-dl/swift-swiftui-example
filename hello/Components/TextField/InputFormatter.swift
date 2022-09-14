//
//  InputFormatter.swift
//  HelloSwift
//
//  Created by 1 on 9/4/22.
//

import SwiftUI

struct InputFormatter: View {
    @State var price:Double = 1.2
    
    let formatterPrice: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Section("格式化 formatter") {
                TextField("格式化数字为货币", value: $price, formatter: formatterPrice)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("formatter")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI", pageID: "InputFormatter"))
    }
}

struct InputFormatter_Previews: PreviewProvider {
    static var previews: some View {
        InputFormatter()
    }
}
