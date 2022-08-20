//
//  p_environment.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI

@available (iOS 14.0, *)
struct p_environment: View {
    @EnvironmentObject var envMedicine: Medicine
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("\(envMedicine.name)")
            
            Text("备注：如上信息，是从其它视图传递过来的数据。\n涉及到代码：@EnvironmentObject")
                .font(.footnote)
        }
        .navigationTitle("接收其它视图传递的数据")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct p_environment_Previews: PreviewProvider {
    static var previews: some View {
        p_environment()
    }
}
