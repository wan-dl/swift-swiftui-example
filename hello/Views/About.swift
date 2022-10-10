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
        VStack(alignment: .center) {
            Image("icon_app")
                .resizable()
                .frame(width: 100, height: 100)
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
                aboutList(title: "去评分")
                Divider()
                
                aboutList(title: "版本更新")
                Divider()
                
                NavigationLink(destination: ReleaseNote(), label: {
                    Text("更新日志")
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                })
                Divider()
                
                NavigationLink(destination: aboutPrivacy(), label: {
                    Text("隐私说明")
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                })
            }
            .padding()
            
            Spacer()
        }
    }
    
    func AppInfo() {
        let BundleInfo = Bundle.main.infoDictionary!
        self.appVersion = BundleInfo["CFBundleShortVersionString"] as! String
        self.appDisplayName = BundleInfo["CFBundleDisplayName"] as! String
    }
    
    
}

fileprivate struct aboutList: View {
    @State var title: String = ""
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            gotoStore()
        }
    }
    
    func gotoStore() {
        let url = URL(string: "itms-apps://itunes.apple.com/cn/app/id1643821819")!
        
        if !UIApplication.shared.canOpenURL(url) {
             return
        }
        
        UIApplication.shared.open(url) { (success) in
            print("跳转状态: \(success)")
        }
    }
}

fileprivate struct aboutPrivacy: View {
    let desc: String = """
本应用未搜集任何信息。

App内 iOS库示例，比如定位等，申请的权限，仅为了在本地演示API功能，没有任何上传和保存。
"""
    var body: some View {
        VStack(alignment: .leading) {
            Text(desc)
                .lineSpacing(10)
            Spacer()
        }
        .padding()
    }
}


struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
