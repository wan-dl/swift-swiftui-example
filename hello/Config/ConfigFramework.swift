//
//  ConfigFramework.swift
//  HelloSwift
//
//  Created by 1 on 9/12/22.
//

import Foundation
//import
struct FrameworkItem: Identifiable {
    var id = UUID()
    var name: String
    var zh: String
    var available: String
    var url: String
    var searchKeyword: String
}

struct FrameworkInfo: Identifiable {
    var id: UUID = UUID()
    var name: String
    var seas: [FrameworkItem]
}

var FrameworkList: [FrameworkInfo] = [
    FrameworkInfo(
        name: "UI",
        seas: [
            FrameworkItem(name: "SwiftUI", zh: "", available: "iOS 13.0+", url: "https://developer.apple.com/documentation/swiftui",  searchKeyword: ""),
            FrameworkItem(name: "Foundation", zh: "", available: "iOS 2.0+", url: "https://developer.apple.com/documentation/foundation",  searchKeyword: ""),
            FrameworkItem(name: "UIKit", zh: "", available: "iOS 2.0+", url: "",  searchKeyword: "")
        ]
    ),
    FrameworkInfo(
        name: "数据库",
        seas: [
            FrameworkItem(name: "SQLite3", zh: "", available: "", url: "",  searchKeyword: "")
        ]
    ),
    FrameworkInfo(
        name: "电话|通讯录|短信|通讯",
        seas: [
            FrameworkItem(name: "AddressBook", zh: "提供访问存储核心数据库中用户联系人信息的功能", available: "iOS 2.0+", url: "https://developer.apple.com/documentation/addressbook",  searchKeyword: ""),
            FrameworkItem(name: "AddressBookUI", zh: "提供一个用户界面，用于显示存储在地址簿中的联系人信息", available: "iOS 2.0+", url: "https://developer.apple.com/documentation/addressbookui",  searchKeyword: ""),
            FrameworkItem(name: "ContactsUI", zh: "访问用户的联系人, bing支持格式化和本地化联系人信息", available: "iOS 9.0+", url: "https://developer.apple.com/documentation/contactsui",  searchKeyword: ""),
            FrameworkItem(name: "Contacts", zh: "在图形界面中显示有关用户联系人的信息", available: "iOS 9.0+", url: "https://developer.apple.com/documentation/contacts",  searchKeyword: ""),
            FrameworkItem(name: "CallKit", zh: "", available: "iOS 10.0+", url: "https://developer.apple.com/documentation/callkit",  searchKeyword: ""),
    ]),
    FrameworkInfo(
        name: "定位 | 地图",
        seas: [
            FrameworkItem(name: "CoreLocation", zh: "", available: "", url: "",  searchKeyword: ""),
            FrameworkItem(name: "CoreLocationUI", zh: "", available: "", url: "",  searchKeyword: ""),
            FrameworkItem(name: "MapKit", zh: "", available: "", url: "",  searchKeyword: ""),
        ]
    ),
    FrameworkInfo(
        name: "音频 | 视频",
        seas: [
            FrameworkItem(name: "AudioToolbox", zh: "包含处理音频流数据以及播放或录制音频的接口", available: "iOS 2.0+", url: "https://developer.apple.com/documentation/audiotoolbox",  searchKeyword: ""),
            FrameworkItem(name: "AudioUnit", zh: "包含加载并使用音频单元的接口", available: "iOS 2.0+", url: "https://developer.apple.com/documentation/audiounit",  searchKeyword: ""),
            FrameworkItem(name: "AVFoundation", zh: "包含播放或录制音频的接口", available: "iOS 2.2+", url: "https://developer.apple.com/documentation/avfoundation",  searchKeyword: ""),
            FrameworkItem(name: "AVKit", zh: "包含加载并使用音频单元的接口", available: "iOS 8.0+", url: "https://developer.apple.com/documentation/avkit",  searchKeyword: ""),
            FrameworkItem(name: "AVRouting", zh: "", available: "iOS 16.0+", url: "https://developer.apple.com/documentation/avrouting",  searchKeyword: ""),
            FrameworkItem(name: "AVFAudio", zh: "", available: "iOS 14.5+", url: "https://developer.apple.com/documentation/avfaudio",  searchKeyword: ""),
            FrameworkItem(name: "MediaPlayer", zh: "iOS 2.0+", available: "", url: "https://developer.apple.com/documentation/mediaplayer",  searchKeyword: ""),
        ]
    ),
    FrameworkInfo(
        name: "图片 | 相册",
        seas: [
            FrameworkItem(name: "ImageIO", zh: "iOS 4.0+", available: "", url: "https://developer.apple.com/documentation/imageio",  searchKeyword: ""),
            FrameworkItem(name: "Photos", zh: "", available: "", url: "https://developer.apple.com/documentation/photokit",  searchKeyword: ""),
            FrameworkItem(name: "PhotosUI", zh: "", available: "", url: "https://developer.apple.com/documentation/photokit",  searchKeyword: ""),
        ]
    ),
    FrameworkInfo(
        name: "日历",
        seas: [
            FrameworkItem(name: "EventKit", zh: "", available: "", url: "",  searchKeyword: ""),
            FrameworkItem(name: "EventKitUI", zh: "", available: "", url: "",  searchKeyword: ""),
        ]
    ),
    FrameworkInfo(
        name: "推送",
        seas: [
            FrameworkItem(name: "PushKit", zh: "", available: "iOS 8.0+", url: "https://developer.apple.com/documentation/pushkit",  searchKeyword: ""),
            FrameworkItem(name: "PushToTalk", zh: "", available: "iOS 16.0+", url: "https://developer.apple.com/documentation/pushtotalk",  searchKeyword: ""),
        ]
    ),
    FrameworkInfo(
        name: "蓝牙",
        seas: [
            FrameworkItem(name: "CoreBluetooth", zh: "", available: "iOS 5.0+", url: "https://developer.apple.com/documentation/corebluetooth",  searchKeyword: "")
        ]
    ),
    FrameworkInfo(
        name: "小组件",
        seas: [
            FrameworkItem(name: "WidgetKit", zh: "", available: "iOS 14.0+", url: "https://developer.apple.com/documentation/widgetkit",  searchKeyword: "")
        ]
    ),
    FrameworkInfo(
        name: "Web",
        seas: [
            FrameworkItem(name: "WebKit", zh: "", available: "iOS 16.0+", url: "https://developer.apple.com/documentation/webkit",  searchKeyword: ""),
            FrameworkItem(name: "LinkPresentation", zh: "", available: "iOS 13.0+", url: "https://developer.apple.com/documentation/linkpresentation",  searchKeyword: "")
        ]
    ),
    FrameworkInfo(
        name: "其它",
        seas: [
            FrameworkItem(name: "CloudKit", zh: "", available: "iOS 8.0+", url: "https://developer.apple.com/documentation/cloudkit",  searchKeyword: ""),
            FrameworkItem(name: "ClockKit", zh: "", available: "iOS 14.0+", url: "https://developer.apple.com/documentation/clockkit",  searchKeyword: ""),
            FrameworkItem(name: "CoreSpotlight", zh: "提供从Spotlight搜索 App 内部的数据的接口", available: "iOS 9.0+", url: "https://developer.apple.com/documentation/clockkit",  searchKeyword: ""),
            FrameworkItem(name: "WeatherKit", zh: "提供方法天气状况的接口", available: "iOS 16.0+", url: "https://developer.apple.com/documentation/weatherkit",  searchKeyword: ""),
            
        ]
    ),
    FrameworkInfo(
        name: "Watch",
        seas: [
            FrameworkItem(name: "WatchKit", zh: "", available: "watchOS 2.0+", url: "https://developer.apple.com/documentation/watchkit",  searchKeyword: "")
        ]
    ),
]

