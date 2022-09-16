//
//  api_video.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI
import AVKit

@available (iOS 14.0, *)
struct api_video: View {
    
    var videoUrl: String = "https://vkceyugu.cdn.bspapp.com/VKCEYUGU-0c1fa337-7340-4755-9bec-f766d7d31833/93216998-b76e-405c-8067-eec00d7fad99.mp4"
    
    @State var player = AVPlayer()
    @State var videoStartTime: CMTime = CMTimeMake(value: 10, timescale: 1)
    @State var isPlaying: Bool = false
    
    var body: some View {
        VStack {
            Text("简介：本窗口视频是从网络下载，使用了AVkit库。\n主要代码为：AVPlayer(url: URL(string: url)!)")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
            
            VideoPlayer(player: player)
                .onAppear() {
                    player = AVPlayer(url: URL(string: videoUrl)!)
                    player.rate = 1.5
                }
                .frame(height: 215)
                .frame(maxWidth: .infinity)
            
            HStack {
                Button(action: { player.play() }, label: {
                    Label("", systemImage: "play.fill")
                })
                
                Button(action: { player.pause() }, label: {
                    Label("", systemImage: "pause")
                })
            }
            .padding()
            .offset(y: 20)
        }
        .navigationTitle("Video")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "API",pageID: "VideoPlayer"))
    }
}

struct api_video_Previews: PreviewProvider {
    static var previews: some View {
        api_video()
    }
}
