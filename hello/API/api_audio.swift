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
            .buttonStyle(PrimaryBtnStyle())
            .padding()
        }
        .navigationBarTitle("Audio", displayMode: .inline)
    }
    
    func playAudio() {
        let FilePath = Bundle.main.url(forResource: "abc.mp3", withExtension: nil, subdirectory: "/Resouces.bundle")
        if let BDURL = FilePath {
            do {
                try self.BDPlayer = AVAudioPlayer(contentsOf: BDURL) /// make the audio player
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
