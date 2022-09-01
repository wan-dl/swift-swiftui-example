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
                Label("播放Bundel下的Mp3音频", systemImage: "waveform.circle")
            })
            .tint(.purple)
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            .padding()
            
            Text("说明：本页面音频示例，是从 app bundle 中加载的资源。使用AVkit库。\n主要代码为：AVAudioPlayer(contentsOf: URL)")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
        }
        .navigationBarTitle("Audio", displayMode: .inline)
    }
    
    func playAudio() {
        let FilePath = Bundle.main.url(forResource: "abc.mp3", withExtension: nil, subdirectory: "/Resouces.bundle")
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
