//
//  ViewStepper.swift
//  format
//
//  Created by 1 on 7/28/22.
//

import SwiftUI

struct v_Stepper: View {
    @State private var StepperValue = 0
    
    var body: some View {
        VStack {
            Form {
                Stepper(
                    value: $StepperValue,
                    in: 1...100,
                    step: 4
                ) {
                    Text("Text: \(StepperValue)")
                }
            }
        }
        .navigationBarTitle("Stepper")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Stepper"))
    }
}

struct v_Stepper_Previews: PreviewProvider {
    static var previews: some View {
        v_Stepper()
    }
}
