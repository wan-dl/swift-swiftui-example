//
//  api_share.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI


struct api_share: View {
    var body: some View {
        VStack {
            Button(action: {
                shareButton()
            }, label: {
                Label("系统分享", systemImage: "square.and.arrow.up")
                    .frame(width: 200)
            })
            .tint(.purple)
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            
            Text("说明：本页面功能主要用到了： UIApplication.shared.windows ")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
        }
        .padding()
        .navigationBarTitle("Shared - 系统分享", displayMode: .inline)
    }
    
    func shareButton() {
        let url = URL(string: "https://www.fformat.com")
        let activityController = UIActivityViewController(
            activityItems: [url!],
            applicationActivities: nil
        )
        
        UIApplication.shared.windows.first?.rootViewController!.present(
            activityController,
            animated: true,
            completion: nil
        )
    }
    
}

struct api_share_Previews: PreviewProvider {
    static var previews: some View {
        api_share()
    }
}
