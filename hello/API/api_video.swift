//
//  api_video.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI
import AVKit
import AVFAudio

@available (iOS 14.0, *)
struct api_video: View {
    @State var player = AVPlayer()
    
    @State var videoStartTime: CMTime = CMTimeMake(value: 10, timescale: 1)
    
    @State var isPlaying: Bool = false
    
    var videoUrl: String = "https://vkceyugu.cdn.bspapp.com/VKCEYUGU-0c1fa337-7340-4755-9bec-f766d7d31833/2568a673-d3f7-4e8a-8343-93f7229958fc.MP4"
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .onAppear() {
                    player = AVPlayer(url: URL(string: videoUrl)!)
                    player.rate = 1.5
                }
                .frame(height: 300)
            
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
        .navigationBarTitle("Video", displayMode: .inline)
    }
}

struct api_video_Previews: PreviewProvider {
    static var previews: some View {
        api_video()
    }
}
