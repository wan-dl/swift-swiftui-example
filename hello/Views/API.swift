//
//  API.swift
//  HelloSwift
//
//  Created by 1 on 8/1/22.
//

import SwiftUI

struct API: View {
    
    var body: some View {
        VStack {
            showApiListView2
        }
        .navigationTitle("API 示例")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 44)
        })
    }
    
    // 2022-9-10 快速切换时，此页面闪退。因此弃用
    var showApiListView1: some View {
        List(ApiList, id: \.id) { info in
            Section(header: Text(info.name)) {
                ForEach(info.seas, id: \.id) { item in
                    NavigationLink(item.name, destination: {
                        item.viewname
                    })
                }
            }
        }
        .listStyle(.insetGrouped)
    }
    
    var showApiListView2: some View {
        List {
            Section(header: Text("")) {
                NavigationLink("获取设备信息", destination: api_getSystemInfo())
                NavigationLink("openURL", destination: api_openURL())
                NavigationLink("Shared - 系统分享", destination: api_share())
                NavigationLink("UIPasteboard - 剪切板", destination: api_clipboard())
                NavigationLink("WebView", destination: api_WebView())
            }
            
            Section(header: Text("")) {
                NavigationLink("Contacts - 联系人", destination: api_Contacts())
                NavigationLink("Notification - 本地通知", destination: api_Notifications())
//                NavigationLink("WeatherKit - 天气", destination: api_WeatherKit())
            }
            
            Section(header: Text("定位")) {
                NavigationLink("CoreLocation", destination: api_CoreLocation())
                NavigationLink("CoreLocationUI", destination: api_CoreLocationUI())
            }
            
            Section(header: Text("数据")) {
                NavigationLink("UserDefaults", destination: api_UserDefaults())
                NavigationLink("SQLite3", destination: api_SQLite3())
            }
            
            Section(header: Text("网络请求")) {
                NavigationLink("网络状态", destination: api_network())
                NavigationLink("URLSession Get", destination: api_URLSession())
                NavigationLink("URLSession Post", destination: api_URLSession_Post())
            }
            
            Section(header: Text("相册相机")) {
                //NavigationLink("PHPicker - 相册", destination: api_PHPicker())
                NavigationLink("PhotosPicker - 相册", destination: api_PhotosPicker())
                NavigationLink("UIImagePickerController - 相机相册", destination: api_camera_photo())
                NavigationLink("保存图片到相册", destination: api_saveImage())
            }
            
            Section(header: Text("媒体")) {
                NavigationLink("Video - 播放网络视频", destination: api_video())
                NavigationLink("Audio - 播放音频", destination: api_audio())
                NavigationLink("录音", destination: api_RecordSound())
            }
        }
        .listStyle(.insetGrouped)
    }
}

struct API_Previews: PreviewProvider {
    static var previews: some View {
        API()
    }
}
