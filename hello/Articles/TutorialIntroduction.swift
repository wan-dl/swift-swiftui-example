//
//  TutorialIntroduction.swift
//  HelloSwift
//
//  Created by 1 on 9/10/22.
//

import SwiftUI

struct TutorialIntroduction: View {
    
    var body: some View {
        VStack {
            Text("Hello World!")
        }
        .navigationTitle("入门")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TutorialIntroduction_Previews: PreviewProvider {
    static var previews: some View {
        TutorialIntroduction()
    }
}
