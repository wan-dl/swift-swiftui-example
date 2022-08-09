//
//  v_Toggle.swift
//  format
//
//  Created by hx on 7/28/22.
//

import SwiftUI

struct v_Toggle: View {
    @State private var isShare: Bool = true
    
    @State private var checked1: Bool = true
    @State private var checked2: Bool = true
    
    var body: some View {
        VStack {
            Form {
                Toggle("是否共享", isOn: $isShare)
                
                Toggle(isOn: $checked1, label: {
                    if checked1 {
                        Text("晚上撸串吧").strikethrough()
                    } else {
                        Text("晚上撸串吧")
                    }
                })
                .toggleStyle(CheckBoxForStyle(stype: "circle"))
                
                
                Toggle(isOn: $checked2, label: {
                    if checked2 {
                        Text("晚上喝酒吧").strikethrough()
                    } else {
                        Text("晚上喝酒吧")
                    }
                })
                .toggleStyle(CheckBoxForStyle(stype: "square"))
            }
        }
        .navigationBarTitle(Text("Toggle"), displayMode: .inline)
    }
}

struct CheckBoxForStyle: ToggleStyle {
    var stype:String
    init(stype:String) {
        self.stype = stype
    }
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            
            Image(systemName: configuration.isOn ? "checkmark.\(stype).fill" : "\(stype)")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .purple : .gray)
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
                Spacer()
                
            
        }
    }
}


struct v_Toggle_Previews: PreviewProvider {
    static var previews: some View {
        v_Toggle()
    }
}
