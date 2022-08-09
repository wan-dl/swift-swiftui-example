//
//  p_navigation.swift
//  format
//
//  Created by 1 on 7/29/22.
//

import SwiftUI

struct p_navigation: View {
    var body: some View {
        VStack {
            Text("导航栏定制")
                .font(.title)
                .navigationBarItems(
                    leading: Text(""),
                    trailing:
                    Button(action: {}) {
                      Text("Save")
                    }
                )
            
            Divider()
            
            Text("注意：导航栏顶部右上角多了save")
        }
    }
}

struct p_navigation_Previews: PreviewProvider {
    static var previews: some View {
        p_navigation()
    }
}
