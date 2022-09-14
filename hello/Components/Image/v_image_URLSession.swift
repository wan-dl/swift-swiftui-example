//
//  v_image_URLSession.swift
//  HelloSwift
//
//  Created by 1 on 9/14/22.
//

import SwiftUI

struct v_image_URLSession: View {
    @State private var remoteImage: UIImage? = nil
    @State var netWorkErrorMsg:String = ""
    let placholderImage = UIImage(systemName: "photo.on.rectangle.angled")
    
    var body: some View {
        VStack(spacing: 30) {
            if (self.remoteImage != nil) {
                Image(uiImage: self.remoteImage ?? placholderImage!)
                    .resizable()
                    .frame(height: 200)
                    .onAppear(perform: fetchRemoteImage)
                
                Text("备注：本图片是采用URLSession从网络下载")
                    .font(.footnote)
            } else {
                Image(systemName: "photo.on.rectangle.angled")
                
                if netWorkErrorMsg != "" {
                    Text(netWorkErrorMsg)
                        .font(.body)
                        .foregroundColor(.gray)
                }
            }
        }
        .onAppear(perform: fetchRemoteImage)
        .navigationTitle("使用URLSession下载图片")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "ImageURLSession"))
    }
    
    func fetchRemoteImage() {
        guard let url = URL(string: "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png") else {return}
        
        let config = URLSessionConfiguration.default
        config.allowsExpensiveNetworkAccess = false
        config.allowsConstrainedNetworkAccess = false
        config.timeoutIntervalForRequest = 20
        config.timeoutIntervalForResource = 20
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        
        session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                if (error as? URLError)?.code == .timedOut {
                    netWorkErrorMsg = "网络请求超时，请检查网络"
                }
                if (error as? URLError)?.code == .badURL {
                    netWorkErrorMsg = "错误的URL"
                }
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 530) ~= response.statusCode else {
                netWorkErrorMsg = "Error: HTTP请求失败"
                return
            }
            let statusCode = response.statusCode
            if statusCode != 200 {
                netWorkErrorMsg = "Error: HTTP请求失败, HTTP状态码: \(statusCode)"
                return
            }
            
            if let image = UIImage(data: data!) {
                self.remoteImage = image
            } else {
                print(error ?? "")
            }
        }
        .resume()
    }
}

struct v_image_URLSession_Previews: PreviewProvider {
    static var previews: some View {
        v_image_URLSession()
    }
}
