//
//  api_audio.swift
//  HelloSwift
//
//  Created by 1 on 8/3/22.
//

import SwiftUI
import AVKit

struct api_audio: View {
    @State var BDPlayer: AVAudioPlayer?
    
    var body: some View {
        VStack {
            
            Button(action: {
                playAudio()
            }, label: {
                Label("播放Bundle下的音频文件", systemImage: "waveform.circle")
            })
            .tint(.purple)
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            .padding()
            
            Text("说明：本页面音频文件，是从 App Bundle 中加载的资源，播放时，请打开声音。\n\n本示例使用AVkit库, 主要代码为：AVAudioPlayer(contentsOf: URL)")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
        }
        .navigationTitle("Audio")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "API",pageID: "Audio"))
    }
    
    func playAudio() {
        // abc.mp3音频文件是项目下Resouces下的文件
        let FilePath = Bundle.main.url(forResource: "example_audio.m4a", withExtension: nil, subdirectory: "/Resouces.bundle/media")
        if let BDURL = FilePath {
            do {
                try self.BDPlayer = AVAudioPlayer(contentsOf: BDURL)
                self.BDPlayer?.volume = 5
                self.BDPlayer?.play()
            } catch {
                print("Couldn't play audio. Error: \(error)")
            }
        }
    }
    
}

struct api_audio_Previews: PreviewProvider {
    static var previews: some View {
        api_audio()
    }
}
