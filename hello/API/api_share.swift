//
//  api_share.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI


struct api_share: View {
    var body: some View {
        HStack {
            Button(action: {
                shareButton()
            }, label: {
                Label("分享", systemImage: "")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.title3)
                    .foregroundColor(.white)
            })
            .buttonStyle(PrimaryBtnStyle())
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
