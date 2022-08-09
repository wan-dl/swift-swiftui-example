//
//  ViewStepper.swift
//  format
//
//  Created by hx on 7/28/22.
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
        .navigationBarTitle(Text("Stepper"), displayMode: .inline)
    }
}

struct v_Stepper_Previews: PreviewProvider {
    static var previews: some View {
        v_Stepper()
    }
}
