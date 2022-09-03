//
//  About.swift
//  HelloSwift
//
//  Created by 1 on 9/3/22.
//

import SwiftUI

struct About: View {
    
    @State private var appDisplayName: String = ""
    @State private var appVersion: String = ""
    
    var body: some View {
        VStack {
            Image("code")
                .resizable()
                .frame(width: 64, height: 64)
            VStack(alignment: .center, spacing: 15) {
                Text(appDisplayName)
                    .font(.title)
                
                Text("Version \(appVersion)")
                    .font(.body)
            }
            .onAppear() {
                AppInfo()
            }
            
            VStack(alignment:.leading, spacing: 20) {
                HStack {
                    Text("去评分")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                Divider()
                HStack {
                    Text("版本更新")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
            .padding()
        }

    }
    
    func AppInfo() {
        let BundleInfo = Bundle.main.infoDictionary!
        self.appVersion = BundleInfo["CFBundleShortVersionString"] as! String
        self.appDisplayName = BundleInfo["CFBundleDisplayName"] as! String
        // let appBuild = BundleInfo["CFBundleVersion"] as! String
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
