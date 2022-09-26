//
//  ViewScrollView.swift
//  format
//
//  Created by 1 on 7/29/22.
//

import SwiftUI

struct v_ScrollView: View {
    var body: some View {
        List {
            Section() {
                NavigationLink("纵向滚动", destination: v_ScrollView_vertical())
            }
            
            Section() {
                NavigationLink("水平滚动", destination: v_ScrollView_horizontal())
            }
        }
    }
}

struct v_ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        v_ScrollView()
    }
}
