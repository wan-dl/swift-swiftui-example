//
//  api_PhotosUI.swift
//  HelloSwift
//
//  Created by 1 on 8/6/22.
//

// PhontosPicker文档
// matching 可以选择相册照片类型。常用的值：.images .videos  .any(of: [.images, .videos])  .any(of: [.images, .not(.livePhotos)])

import SwiftUI
import PhotosUI
import AVKit

struct api_PhotosPicker: View {
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center) {
                
                Text("本示例适用于iOS 16.0+，用到了PhotosPicker()")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(height: 200)
                
                if #available(iOS 16.0, *) {
                    choicePhoto()
                    
                    choiceMorePhoto()
                    
                    choiceVideo()
                }
            }
            .navigationBarTitle("PhotosPicker", displayMode: .inline)
        }
        
    }
}

// 选择一张图片
@available (iOS 16.0, *)
struct choicePhoto: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        
        PhotosPicker(
            selection: $selectedItem,
            matching: .images,
            preferredItemEncoding: .automatic,
            photoLibrary: .shared()
        ) {
            Label("选择一张照片", systemImage: "photo")
                .frame(width: 200)
        }
        .tint(.purple)
        .controlSize(.large)
        .buttonStyle(.borderedProminent)
        // onChange()修饰符来检测selectedItem的变化
        .onChange(of: selectedItem) { newItem in
            Task {
                // loadTransferable()方法来获取选择的照片的数据
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    selectedImageData = data
                }
            }
        }
        
        // 将选择的照片显示出来
        if let selectedImageData,
           let uiImage = UIImage(data: selectedImageData)  {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 100)
        }
    }
}

// 选择多张图片
@available (iOS 16.0, *)
struct choiceMorePhoto: View {
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImageData: [Data] = []
    
    var body: some View {
        
        PhotosPicker(
            selection: $selectedItems,
            maxSelectionCount: 9,
            matching: .images,
            photoLibrary: .shared()
        ) {
            Label("选择多张照片", systemImage: "photo")
                .frame(width: 200)
        }
        .tint(.purple)
        .controlSize(.large)
        .buttonStyle(.borderedProminent)
        .onChange(of: selectedItems) { newItems in
            if !newItems.isEmpty {
                selectedImageData = []
            }
            for item in newItems {
                Task {
                    if let data = try? await item.loadTransferable(type: Data.self) {
                        selectedImageData.append(data)
                    }
                }
            }
        }
        
        // 将选择的照片显示出来
        if !selectedImageData.isEmpty {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center) {
                    ForEach(selectedImageData, id: \.self) { photoData in
                        if let img = UIImage(data: photoData) {
                            Image(uiImage: img)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 100)
                        }
                    }
                }
                .frame(height: 130)
            }
        }
            
    }
}


@available (iOS 16.0, *)
struct choiceVideo: View {
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedVideoData: Data? = nil
    
    @State private var player = AVPlayer()
    
    var body: some View {
        PhotosPicker(
            selection: $selectedItem,
            matching: .videos,
            label: {
                Label("选择视频", systemImage: "video")
                    .frame(width: 200)
            }
        )
        .tint(.primary)
        .controlSize(.large)
        .buttonStyle(.borderedProminent)
        .onChange(of: selectedItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    selectedVideoData = data
                    
                }
            }
        }
        
        // todo: play video
        if selectedVideoData != nil {
            
        }
    }
}

struct api_PhotosPicker_Previews: PreviewProvider {
    static var previews: some View {
        api_PhotosPicker()
    }
}
