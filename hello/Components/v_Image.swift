//
//  ViewImage.swift
//  format
//
//  Created by hx on 7/29/22.
//

import SwiftUI

struct v_Image: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Picker("", selection: $selectedTab) {
                Text("SF符号").tag(0)
                Text("本地图片").tag(1)
                Text("网络图片1").tag(2)
                Text("网络图片2").tag(3)
           }
           .pickerStyle(SegmentedPickerStyle())

           switch(selectedTab) {
           case 0: exampleSFImage()
           case 1: exampleLoadImage()
           case 2: exampleNetWorkImage1()
           case 3: exampleNetWorkImage2()
           default: exampleSFImage()}
            
            Spacer()
        }
        .navigationBarTitle(Text("Image"), displayMode: .inline)
    }
}

struct exampleSFImage: View {
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            Image(systemName: "leaf.fill")
                .foregroundColor(.green)
        }
        .padding()
    }
}

struct exampleLoadImage: View {
    var body: some View {
        VStack() {
            Image("wuhuan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
        }
    }
}

struct exampleNetWorkImage1: View {
    @State private var remoteImage: UIImage? = nil
    let placholderImage = UIImage(named: "wuhuan")
    
    var body: some View {
        Image(uiImage: self.remoteImage ?? placholderImage!)
            .resizable()
            .onAppear(perform: fetchRemoteImage)
    }
    
    func fetchRemoteImage() {
        guard let url = URL(string: "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png") else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
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

struct exampleNetWorkImage2: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://ydlunacommon-cdn.nosdn.127.net/abc2e00ba59ece4101a89a01cce818da.png")) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 50, height: 50)
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
