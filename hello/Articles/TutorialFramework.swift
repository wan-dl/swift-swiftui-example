//
//  TutorialFramework.swift
//  HelloSwift
//
//  Created by 1 on 9/10/22.
//

import SwiftUI

struct TutorialFramework: View {
    var body: some View {
        VStack {
            Text("Hello World!")
        }
        .navigationTitle("入门")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TutorialFramework_Previews: PreviewProvider {
    static var previews: some View {
        TutorialFramework()
    }
}
