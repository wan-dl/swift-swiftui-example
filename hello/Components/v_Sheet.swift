//
//  ViewSheet.swift
//  format
//
//  Created by 1 on 7/28/22.
//

// docs: https://swiftwithmajid.com/2022/07/19/bottom-sheet-api-in-swiftui/

import SwiftUI

@available (iOS 13.0, *)
struct v_Sheet: View {
    @State private var sheetShown = false
    @State private var query = ""

    var body: some View {
        VStack() {
            
            Show_SwiftUI_Docs(available_versions: ui_sheet_available_versions, desc: ui_sheet_desc, declaration: ui_sheet_declaration)
            
            Button("点击显示底部sheet") {
                sheetShown = true
            }
            .buttonStyle(.bordered)
            .sheet(isPresented: $sheetShown) {
                NavigationView {
                    Text("You query: \(query)")
                        .searchable(text: $query)
                        .navigationTitle("Search")
                }
                // iOS 16.0 增加.presentationDetents() 修饰符，可以控制sheet大小
                // .presentationDetents([.medium])
            }
            
            Spacer()
        }
        .navigationTitle(".sheet")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct v_Sheet_Previews: PreviewProvider {
    static var previews: some View {
        v_Sheet()
    }
}
