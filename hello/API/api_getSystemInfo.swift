//
//  api_getSystemInfo.swift
//  HelloSwift
//
//  Created by 1 on 8/1/22.
//

import SwiftUI

struct DeviceItem: Identifiable {
    let id = UUID()
    let name: String
    let desc: String
    let value: String
}

struct api_getSystemInfo: View {
    @State var DeviceInfo:[DeviceItem] = []
    
    var body: some View {
        List {
            Section() {
                ForEach(DeviceInfo) { item in
                    HStack() {
                        Text(item.desc)
                            .frame(width: 100)
                        Text(item.value)
                            .font(.body)
                            .lineLimit(1)
                    }
                }
            }
            
            Button("重新获取", action: {
                getDeviceInfo()
            })
            .frame(maxWidth: .infinity,alignment: .center)
        }
        .listStyle(.grouped)
        .onAppear() {
            getDeviceInfo()
        }
        .navigationTitle("设备信息")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "API",pageID: "getSystemInfo"))
    }
    
    func getDeviceInfo() {
        self.DeviceInfo = []
        
        let deviceName = UIDevice.current.name
        self.DeviceInfo.append(DeviceItem(name: "name", desc: "设备名称", value: deviceName))
        
        let deviceID = UIDevice.current.identifierForVendor?.uuidString
        self.DeviceInfo.append(DeviceItem(name: "uuidString", desc: "设备ID", value: deviceID!))
        
        let systemName = UIDevice.current.systemName
        self.DeviceInfo.append(DeviceItem(name: "systemName", desc: "系统名称", value: systemName))
        
        let systemVersion = UIDevice.current.systemVersion
        self.DeviceInfo.append(DeviceItem(name: "systemVersion", desc: "系统版本", value: systemVersion))
        
        let model = UIDevice.current.model
        self.DeviceInfo.append(DeviceItem(name: "model", desc: "设备型号", value: model))
        
        let isPortrait = UIDevice.current.orientation.isPortrait
        self.DeviceInfo.append(DeviceItem(name: "model", desc: "横屏", value: "\(isPortrait)"))
        
        let isLandscape = UIDevice.current.orientation.isLandscape
        self.DeviceInfo.append(DeviceItem(name: "model", desc: "竖屏", value: "\(isLandscape)"))
        
        let screenHeight = UIScreen.main.bounds.height
        self.DeviceInfo.append(DeviceItem(name: "height", desc: "屏幕高度", value: "\(screenHeight)"))
        
        UIDevice.current.isBatteryMonitoringEnabled = true
        let screenWidth = UIScreen.main.bounds.width
        self.DeviceInfo.append(DeviceItem(name: "width", desc: "屏幕宽度", value: "\(screenWidth)"))
        
        let battery = UIDevice.current.batteryLevel * 100
        self.DeviceInfo.append(DeviceItem(name: "battery", desc: "电量", value: "\(battery)"))
    }
}

struct api_getSystemInfo_Previews: PreviewProvider {
    static var previews: some View {
        api_getSystemInfo()
    }
}
