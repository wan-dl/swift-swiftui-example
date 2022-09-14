//
//  api_network.swift
//  HelloSwift
//
//  Created by 1 on 8/23/22.
//

import SwiftUI

struct api_network: View {
    @EnvironmentObject var network: NetworkMonitor
    
    var body: some View {
        VStack(spacing: 40) {
            Text(network.isActive ? "网络状态：在线" : "网络状态：无网络或App无网络访问权限")
            
            Text("网络类型：") + Text(verbatim: "\(network.connectionType)")
                .font(.title)
            
            Text("试试切换蜂窝网络、WIFI、或关闭网络，此处会自动刷新")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .navigationTitle("获取网络状态")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "API",pageID: "NetMonitor"))
    }
}

struct api_network_Previews: PreviewProvider {
    static var previews: some View {
        api_network()
    }
}
