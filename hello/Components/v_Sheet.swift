//
//  ViewSheet.swift
//  format
//
//  Created by 1 on 7/28/22.
//

// docs: https://swiftwithmajid.com/2022/07/19/bottom-sheet-api-in-swiftui/

import SwiftUI

struct v_Sheet: View {
    @State private var sheetShown = false
        @State private var query = ""

        var body: some View {
            VStack {
                Button("Display bottom sheet") {
                    sheetShown = true
                }
                .sheet(isPresented: $sheetShown) {
                    NavigationView {
                        Text("You query: \(query)")
                            .searchable(text: $query)
                            .navigationTitle("Search")
                    }
                }
            }
            .navigationBarTitle(Text("Sheet"), displayMode: .inline)
    }
    
    func didDismiss() {
        
    }
}

struct v_Sheet_Previews: PreviewProvider {
    static var previews: some View {
        v_Sheet()
    }
}
