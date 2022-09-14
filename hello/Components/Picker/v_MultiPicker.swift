//
//  v_MultiPicker-.swift
//  HelloSwift
//
//  Created by 1 on 9/5/22.
//

import SwiftUI

struct v_MultiPicker: View {
    let provList: Array = ["山西省"]
    let cityList: Array = ["临汾市", "长治市", "大同市", "运城市"]
    
    @State private var selectedProv: String = "山西省"
    @State private var selectedCity: String = "大同市"
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    Picker("selecte prov", selection: $selectedProv) {
                        ForEach(provList, id: \.self) { item in
                            Text(item)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: geometry.size.width / 2, alignment: .center)
                    .clipped()
                    
                    Picker("selecte prov", selection: $selectedCity) {
                        ForEach(cityList, id: \.self) { item in
                            Text(item)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: geometry.size.width / 2, alignment: .center)
                    .clipped()
                }
            }
        }
        .navigationTitle("多列选择器")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "MultiPicker"))
    }
}

struct v_MultiPicker_Previews: PreviewProvider {
    static var previews: some View {
        v_MultiPicker()
    }
}
