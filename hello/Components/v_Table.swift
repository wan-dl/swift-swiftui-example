//
//  ViewTable.swift
//  format
//
//  Created by 1 on 7/28/22.
//

import SwiftUI

struct v_Table: View {
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
    
//    @available(iOS 16.0)
    var body: some View {
        Text("")
//        Table(people) {
//            TableColumn("Given Name", value: \.givenName)
//            TableColumn("Family Name", value: \.familyName)
//            TableColumn("E-Mail Address", value: \.emailAddress)
//        }
    }
}

struct v_Table_Previews: PreviewProvider {
    static var previews: some View {
        v_Table()
    }
}
