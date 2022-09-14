//
//  api_PhotoKit.swift
//  HelloSwift
//
//  Created by 1 on 8/6/22.
//

import SwiftUI
import Photos
import PhotosUI

@available (iOS 14.0, *)
struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    
    @State var images: [UIImage]
    var itemProviders: [NSItemProvider] = []
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        configuration.filter = .images
        configuration.selectionLimit = 3
        
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Use a Coordinator to act as your PHPickerViewControllerDelegate
    class Coordinator: NSObject, PHPickerViewControllerDelegate, UINavigationControllerDelegate {
      
        private var parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            if !results.isEmpty {
                parent.itemProviders = []
                parent.images = []
            }
            parent.itemProviders = results.map(\.itemProvider)
            loadImage()
            
            parent.isPresented = false
        }
        
        private func loadImage() {
            for itemProvider in parent.itemProviders {
                if itemProvider.canLoadObject(ofClass: UIImage.self) {
                    itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                        if let image = image as? UIImage {
                            self.parent.images.append(image)
                        } else {
                            print("Could not load image", error?.localizedDescription ?? "")
                        }
                    }
                }
            }
            print(self.parent.images)
        }
        
    }
}

struct api_PHPicker: View {
    @State private var isPresented: Bool = false
    @State var images: [UIImage] = []
    
    var body: some View {
        
        VStack {
            Button("Present Picker") {
                isPresented.toggle()
            }.sheet(isPresented: $isPresented) {
                PhotoPicker(isPresented: $isPresented, images: images)
            }
        }
        .navigationTitle("PHPickerViewController")
    }
}

struct api_PHPicker_Previews: PreviewProvider {
    static var previews: some View {
        api_PHPicker()
    }
}
