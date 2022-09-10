//
//  API.swift
//  HelloSwift
//
//  Created by 1 on 8/1/22.
//

import SwiftUI

struct API: View {
    
    var body: some View {
        VStack {
            List(ApiList, id: \.id) { info in
                Section(header: Text(info.name)) {
                    ForEach(info.seas, id: \.id) { item in
                        NavigationLink(destination: {
                            item.viewname
                        }, label: {
                            Text(item.name)
                        })
                    }
                }
            }
            .listStyle(.insetGrouped)
        }
        .navigationTitle("API")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 44)
        })
    }
}

struct API_Previews: PreviewProvider {
    static var previews: some View {
        API()
    }
}
