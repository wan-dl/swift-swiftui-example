//
//  ApiConfig.swift
//  HelloSwift
//
//  Created by 1 on 9/10/22.
//
import Foundation
import SwiftUI


struct ApiItem: Identifiable {
    var id = UUID()
    var name: String
    var searchKeyword: String
    var viewname: AnyView
}

struct ApiInfo: Identifiable {
    var id: UUID = UUID()
    var name: String
    var seas: [ApiItem]
}

var ApiList: [ApiInfo] = [
    ApiInfo(
        name: "",
        seas: [
            ApiItem(name: "获取设备信息", searchKeyword: "", viewname: AnyView(api_getSystemInfo())),
            ApiItem(name: "openURL", searchKeyword: "", viewname: AnyView(api_openURL())),
            ApiItem(name: "Shared - 系统分享", searchKeyword: "", viewname: AnyView(api_share())),
            ApiItem(name: "UIPasteboard - 剪切板", searchKeyword: "", viewname: AnyView(api_clipboard())),
            ApiItem(name: "WebView", searchKeyword: "", viewname: AnyView(api_WebView()))
        ]
    ),
    ApiInfo(
        name: "FrameWork",
        seas: [
            ApiItem(name: "Contacts - 联系人", searchKeyword: "", viewname: AnyView(api_Contacts())),
            ApiItem(name: "HealthKit - 健康", searchKeyword: "", viewname: AnyView(api_HealthKit())),
            ApiItem(name: "Notification - 本地通知", searchKeyword: "", viewname: AnyView(api_Notifications())),
            ApiItem(name: "WeatherKit - 天气", searchKeyword: "", viewname: AnyView(api_WeatherKit()))
        ]
    ),
    ApiInfo(
        name: "定位",
        seas: [
            ApiItem(name: "CoreLocation", searchKeyword: "", viewname: AnyView(api_CoreLocation())),
            ApiItem(name: "CoreLocationUI", searchKeyword: "", viewname: AnyView(api_CoreLocationUI()))
        ]
    ),
    ApiInfo(
        name: "数据",
        seas: [
            ApiItem(name: "UserDefaults", searchKeyword: "", viewname: AnyView(api_UserDefaults())),
            ApiItem(name: "SQLite3", searchKeyword: "", viewname: AnyView(api_SQLite3()))
        ]
    ),
    ApiInfo(
        name: "网络",
        seas: [
            ApiItem(name: "网络状态", searchKeyword: "", viewname: AnyView(api_network())),
            ApiItem(name: "URLSession Get", searchKeyword: "", viewname: AnyView(api_URLSession())),
            ApiItem(name: "URLSession Post", searchKeyword: "", viewname: AnyView(api_URLSession_Post()))
        ]
    ),
    ApiInfo(
        name: "相册相机",
        seas: [
            //ApiItem(name: "PHPicker - 相册", searchKeyword: "", viewname: AnyView(api_PHPicker())),
            ApiItem(name: "PhotosPicker - 相册", searchKeyword: "", viewname: AnyView(api_PhotosPicker())),
            ApiItem(name: "UIImagePickerController - 相机相册", searchKeyword: "", viewname: AnyView(api_camera_photo())),
            ApiItem(name: "保存图片到相册", searchKeyword: "", viewname: AnyView(api_saveImage()))
        ]
    ),
    ApiInfo(
        name: "媒体",
        seas: [
            ApiItem(name: "Video - 播放网络视频", searchKeyword: "", viewname: AnyView(api_video())),
            ApiItem(name: "Audio - 播放音频", searchKeyword: "", viewname: AnyView(api_audio())),
            ApiItem(name: "录音", searchKeyword: "", viewname: AnyView(api_RecordSound()))
        ]
    )
]
