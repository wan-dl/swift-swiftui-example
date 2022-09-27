//
//  api_saveImage.swift 保存图片到相机
//  HelloSwift
//
//  Created by 1 on 8/17/22.
//

import SwiftUI
import PhotosUI

struct api_saveImage: View {
    
    // 名称为car的图片为Assets.xcassets下的资源图片
    @State private var localImage: UIImage? = UIImage(named: "car")
    
    @State var isAuthorizationAlert: Bool = false
    @State var isPhotoSaveAlert: Bool = false
    @State var photoSaveStatus: Bool = false
    
    var body: some View {
        VStack {
            Image("car")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                
            Button(action: {
                photoOperate()
            }, label: {
                Label("保存图片到相册", systemImage: "photo")
            })
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .alert("相册权限未开启, 请允许App访问您的相册，以便保存图片", isPresented: $isAuthorizationAlert) {
                Button("我知道了") {}
                Button("前往设置") {
                    openOSSetting()
                }
            }
            .alert("图片保存结果",isPresented: $isPhotoSaveAlert) {
                Button("我知道了") {}
            } message: {
                self.photoSaveStatus ? Text("图片保存成功") : Text("图片保存失败，请检查相册访问权限")
            }
            
        }
        .padding()
        .navigationTitle("保存图片到相册")
        .modifier(navBarViewCodeAndDocs(pageType: "API",pageID: "saveImage"))
    }
    
    // 保存操作
    func saveImage() {
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: self.localImage!)
        }, completionHandler: { (isSuccess, error) in
            DispatchQueue.main.async {
                if error != nil {
                    return
                }
                self.photoSaveStatus = isSuccess ? true : false
                self.isPhotoSaveAlert.toggle()
            }
        })
    }
    
    // 相册权限
    func photoOperate() {
        // let authStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        PHPhotoLibrary.requestAuthorization(for: .addOnly) { (status) in
            DispatchQueue.main.async {
                switch status {
                case .notDetermined:
                    print("相册权限: notDetermined")
                case .restricted:
                    print("相册权限: restricted")
                case .denied:
                    print("相册权限: denied")
                    self.isAuthorizationAlert.toggle()
                case .authorized:
                    saveImage()
                case .limited:
                    print("相册权限: limited")
                @unknown default:
                    print("相册权限: default")
                }
            }
        }
    }
    
}

struct api_saveImage_Previews: PreviewProvider {
    static var previews: some View {
        api_saveImage()
    }
}
