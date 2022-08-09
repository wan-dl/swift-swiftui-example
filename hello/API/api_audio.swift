//
//  api_audio.swift
//  HelloSwift
//
//  Created by 1 on 8/3/22.
//

import SwiftUI
import AVKit

struct api_audio: View {
    @State var player = AVAudioPlayer()
    
    var body: some View {
        VStack {
            Text("xxx")
        }
        .onAppear() {
            print("------------")
            playAudio()
        }
        .navigationBarTitle("Audio", displayMode: .inline)
    }
    
    func playAudio() {
        let path = Bundle.main.path(forResource: "abc", ofType:"mp3")
        if path == nil {return}
        let url = URL(fileURLWithPath: path!)

        do {
            print(url)
            try self.player = AVAudioPlayer(contentsOf: url)
            self.player.prepareToPlay()
            self.player.play()
        } catch {
            print("Couldn't play audio. Error: \(error)")
        }
    }
    
}

struct api_audio_Previews: PreviewProvider {
    static var previews: some View {
        api_audio()
    }
}
