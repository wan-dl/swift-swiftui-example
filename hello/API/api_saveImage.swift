//
//  api_saveImage.swift 保存图片到相机
//  HelloSwift
//
//  Created by 1 on 8/17/22.
//

import SwiftUI
import PhotosUI

struct api_saveImage: View {
    
    @State private var localImage: UIImage? = UIImage(named: "wuhuan")
    
    @State var isAuthorizationAlert: Bool = false
    @State var isShowToast: Bool = false
    @State var photoSaveStatus: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            
            Image("wuhuan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .padding()
            
            Button(action: {
                photoOperate()
            }, label: {
                Label("保存图片到相册", systemImage: "photo")
            })
            .buttonStyle(PrimaryBtnStyle())
            .padding()
            .toast(isShow: $isShowToast, info: photoSaveStatus ? "图片保存成功" : "图片保存失败，请检查相册访问权限")
            .alert(isPresented: $isAuthorizationAlert) {
                Alert(
                    title: Text("相册权限未开启"),
                    message: Text("请允许App访问您的相册，以便保存图片！"),
                    primaryButton: .default(Text("设置"),action: openOSSetting),
                    secondaryButton: .cancel(Text("以后再说"))
                )
            }
        }
        .navigationBarTitle("保存图片到相册", displayMode: .inline)
    }
    
    func saveImage() {
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: self.localImage!)
        }, completionHandler: { (isSuccess, error) in
            DispatchQueue.main.async {
                if error != nil {
                    return
                }
                self.photoSaveStatus = isSuccess ? true : false
                self.isShowToast.toggle()
            }
        })
    }
    
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
