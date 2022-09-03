//
//  ViewTable.swift
//  format
//
//  Created by 1 on 7/28/22.
//

import SwiftUI

struct Person: Identifiable {
    let givenName: String
    let familyName: String
    let emailAddress: String
    let id = UUID()
}
private var people = [
    Person(givenName: "Juan", familyName: "Chavez", emailAddress: "juanchavez@icloud.com"),
    Person(givenName: "Mei", familyName: "Chen", emailAddress: "meichen@icloud.com"),
    Person(givenName: "Tom", familyName: "Clark", emailAddress: "tomclark@icloud.com"),
    Person(givenName: "Gita", familyName: "Kumar", emailAddress: "gitakumar@icloud.com")
]

struct v_Table: View {
    
    var body: some View {
        VStack {
            
            Text("说明: table，仅适用于iOS 16.0+")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
            
            if #available(iOS 16.0, *) {
                Table(people) {
                    TableColumn("Given", value: \.givenName)
                    TableColumn("Family", value: \.familyName)
                    TableColumn("E-Mail", value: \.emailAddress)
                }
            }
        }
    }
}

struct v_Table_Previews: PreviewProvider {
    static var previews: some View {
        v_Table()
    }
}
