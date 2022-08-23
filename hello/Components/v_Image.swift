//
//  ViewImage.swift
//  format
//
//  Created by 1 on 7/29/22.
//  update by 1 on 2022-08-23
//

import SwiftUI

struct v_Image: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        VStack(alignment: .center) {
            Picker("", selection: $selectedTab) {
                Text("SF符号").tag(0)
                Text("本地图片").tag(1)
                Text("网络图片1").tag(2)
                Text("网络图片2").tag(3)
           }
           .pickerStyle(SegmentedPickerStyle())
           
           Spacer()
            
           switch(selectedTab) {
           case 0: exampleSFImage()
           case 1: exampleLoadImage()
           case 2: exampleNetWorkImageUseURLSession()
           case 3: exampleNetWorkImageUseAsyncImage()
           default: exampleSFImage()}
            
           Spacer()
        }
        .navigationTitle("Image")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct exampleSFImage: View {
    var body: some View {
        Image(systemName: "leaf.fill")
            .foregroundColor(.green)
    }
}

struct exampleLoadImage: View {
    var body: some View {
        Image("wuhuan")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaledToFit()
    }
}

struct exampleNetWorkImageUseURLSession: View {
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
    }
    
    func fetchRemoteImage() {
        guard let url = URL(string: "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png2") else {return}
        
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

@available (iOS 15.0, *)
struct exampleNetWorkImageUseAsyncImage: View {
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://ydlunacommon-cdn.nosdn.127.net/abc2e00ba59ece4101a89a01cce818da.png")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            
            Text("备注：本图片是采用AsyncImage从网络下载, AsyncImage适用于iOS 15.0+")
                .font(.footnote)
        }
    }
}

// 使用Bundle方式加载图片
struct UseBundleImageView: View {
    var body: some View {
        Group {
            if let resBundlePath = Bundle.main.path(forResource: "Resources", ofType: "bundle"),
                let resBundle = Bundle(path: resBundlePath),
                let uiImage = UIImage(named: "2022.jpeg", in: resBundle, with: nil){
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                    .clipped()
            } else {
                Color.red
            }
        }
    }
}

struct v_Image_Previews: PreviewProvider {
    static var previews: some View {
        v_Image()
    }
}
