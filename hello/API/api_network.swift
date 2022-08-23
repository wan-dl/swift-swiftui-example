//
//  api_network.swift
//  HelloSwift
//
//  Created by 1 on 8/23/22.
//

import SwiftUI

struct api_network: View {
    @StateObject var network = NetworkMonitor()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            Text(network.isActive ? "网络状态：在线" : "网络状态：无网络或App无网络访问权限")
            
            HStack {
                Text("网络类型：")
                Text(verbatim: "\(network.connectionType)")
                    .font(.title)
            }
        }
        .navigationTitle("获取网络状态")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct api_network_Previews: PreviewProvider {
    static var previews: some View {
        api_network()
    }
}
