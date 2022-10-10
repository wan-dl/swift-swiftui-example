//
//  ReleaseNote.swift
//  Hello
//
//  Created by 1 on 10/7/22.
//

import SwiftUI

fileprivate var changeLogs: String = """
v1.0.3
  * App上线了
"""

struct ReleaseNote: View {
    var body: some View {
        ScrollView {
            Text(changeLogs)
                .lineSpacing(10)
                .padding()
        }
    }
}

struct ReleaseNote_Previews: PreviewProvider {
    static var previews: some View {
        ReleaseNote()
    }
}
