//
//  v_Navigation.swift
//  format
//
//  Created by 1 on 7/29/22.
//

import SwiftUI

struct v_Navigation: View {
    
    var body: some View {
        VStack(spacing: 30) {
            
            NavigationLink("跳转到Map页面", destination: v_Maps())
            
            NavigationLink(destination: v_Image()){
                Label("跳转到Image页面", systemImage: "photo")
            }
        }
        .navigationBarTitle(Text("Navigation"), displayMode: .inline)
    }
}

struct v_Navigation_Previews: PreviewProvider {
    static var previews: some View {
        v_Navigation()
    }
}
