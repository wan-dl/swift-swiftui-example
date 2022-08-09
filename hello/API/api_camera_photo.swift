//
//  api_camera_photo.swift
//  HelloSwift
//
//  Created by 1 on 8/7/22.
//

import SwiftUI
import Photos

struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) private var presentationMode
    
    let sourceType: UIImagePickerController.SourceType
    let onImagePicked: (UIImage) -> Void
 
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
 
        @Binding private var presentationMode: PresentationMode
        private let sourceType: UIImagePickerController.SourceType
        private let onImagePicked: (UIImage) -> Void
 
        init(presentationMode: Binding<PresentationMode>,
             sourceType: UIImagePickerController.SourceType,
             onImagePicked: @escaping (UIImage) -> Void) {
            _presentationMode = presentationMode
            self.sourceType = sourceType
            self.onImagePicked = onImagePicked
        }
 
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            onImagePicked(uiImage)
            presentationMode.dismiss()
        }
 
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.dismiss()
        }
 
    }
 
    func makeCoordinator() -> Coordinator {
        return Coordinator(
            presentationMode: presentationMode,
            sourceType: sourceType,
            onImagePicked: onImagePicked
        )
    }
 
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
 
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
}

struct api_camera_photo: View {
    
    @State private var isShowPhoto = false
    @State private var isShowCamera = false
    @State private var image: UIImage = UIImage()
    
    @State private var cameraPermissionNotEnabled: Bool = false
    @State private var photoPermissionNoteEnabled: Bool = false
    
    var body: some View {
        
        VStack {
            
            Button(action: {
                let checkResult = checkCameraPermission()
                if checkResult {
                    self.isShowCamera.toggle()
                } else {
                    self.cameraPermissionNotEnabled.toggle()
                }
            }, label: {
                Label("打开相机", systemImage: "camera")
            })
            .buttonStyle(PrimaryBtnStyle())
            .alert("相机权限未开启", isPresented: $cameraPermissionNotEnabled) {
                Button("我知道了") {}
                Button("前往设置") {
                    openOSSetting()
                }
            } message: {
                Text("请在iPhone的 “设置” 选项中，允许此应用访问你的摄像头")
            }
            .fullScreenCover(isPresented: $isShowCamera) {
                VStack {
                    ImagePicker(sourceType: .camera) { image in
                        self.image = image
                    }.ignoresSafeArea()
                }
            }
            
            Button(action: {
                let authResult = checkPhotoPermission()
                if authResult {
                    self.isShowPhoto.toggle()
                } else {
                    self.photoPermissionNoteEnabled.toggle()
                }
            }, label: {
                Label("从相册选择照片", systemImage: "photo.on.rectangle")
            })
            .buttonStyle(PrimaryBtnStyle())
            .alert("相册权限未开启", isPresented: $photoPermissionNoteEnabled) {
                Button("我知道了") {}
                Button("前往设置") {
                    openOSSetting()
                }
            }
            .fullScreenCover(isPresented: $isShowPhoto) {
                VStack {
                    ImagePicker(sourceType: .photoLibrary) { image in
                        self.image = image
                    }.ignoresSafeArea()
                }
            }
            
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
        }
        .padding()
        .navigationBarTitle("camera - 调用相机", displayMode: .inline)
        
    }
    
    func checkCameraPermission() -> Bool {
        let authStatus = AVCaptureDevice.authorizationStatus(for: .video)
        return authStatus != .restricted && authStatus != .denied
    }
    
    func checkPhotoPermission() -> Bool {
        let authStatus = PHPhotoLibrary.authorizationStatus()
        return authStatus != .restricted && authStatus != .denied
    }
}



struct api_camera_photo_Previews: PreviewProvider {
    static var previews: some View {
        api_camera_photo()
    }
}
