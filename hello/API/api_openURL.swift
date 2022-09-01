//
//  api_openURL.swift
//  HelloSwift
//
//  Created by 1 on 8/18/22.
//

import SwiftUI

struct URLInfo: Identifiable {
    let id = UUID()
    let name: String
    let url: String
}

let URLList: [URLInfo] = [
    URLInfo(name: "打开Safari浏览器", url: "https://www.apple.com"),
    URLInfo(name: "拨打电话 10086", url: "tel://10086"),
    URLInfo(name: "发送短信 10086", url: "sms://10086"),
    URLInfo(name: "打开Email", url: "mailto://"),
    URLInfo(name: "打开AppStore", url: "itms-apps://itunes.apple.com"),
    URLInfo(name: "打开App 淘宝", url: "taobao://taobao.com"),
    URLInfo(name: "打开App 微信扫一扫", url: "weixin://scanqrcode"),
    URLInfo(name: "打开App 支付宝", url: "alipay://"),
    URLInfo(name: "打开App QQ", url: "mqq://"),
    URLInfo(name: "打开App 微博", url: "sinaweibo://")
]

struct api_openURL: View {
    var body: some View {
        ScrollView {
            
            Text("简介：本窗口主要代码为：UIApplication.shared.open(url)")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
            
            ForEach(URLList) { item in
                Button(action: {
                    let url = URL(string: item.url)!
                    UIApplication.shared.open(url) { (success) in
                        print("打开状态: \(success)")
                    }
                }, label: {
                    Text(item.name)
                })
                .buttonStyle(PrimaryBtnStyle())
            }
            
        }
        .padding()
        .navigationBarTitle("openURL", displayMode: .inline)
    }
}

struct api_openURL_Previews: PreviewProvider {
    static var previews: some View {
        api_openURL()
    }
}
