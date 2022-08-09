//
//  p_environment.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI

struct p_environment: View {
    @EnvironmentObject var envMedicine: Medicine
    
    var body: some View {
        VStack {
            Text("药材名称: \(envMedicine.name)")
        }
    }
}

struct p_environment_Previews: PreviewProvider {
    static var previews: some View {
        p_environment()
    }
}
