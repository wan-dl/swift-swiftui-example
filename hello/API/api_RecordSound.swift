//
//  api_RecordSound.swift
//  HelloSwift 录音
//
//  Created by 1 on 8/13/22.
//

import SwiftUI
import Foundation
import AVFoundation

class RecordManager {
    
    var recorder: AVAudioRecorder?
    var player: AVAudioPlayer?
    let file_path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first?.appending("/record.wav")
    
    
    //开始录音
    func beginRecord() {
        let session = AVAudioSession.sharedInstance()
        
        //设置session类型
        do {
            try session.setCategory(AVAudioSession.Category.playAndRecord)
        } catch let err{
            print("设置类型失败:\(err.localizedDescription)")
        }
        //设置session动作
        do {
            try session.setActive(true)
        } catch let err {
            print("初始化动作失败:\(err.localizedDescription)")
        }
        
        //录音设置，注意，后面需要转换成NSNumber，如果不转换，你会发现，无法录制音频文件，我猜测是因为底层还是用OC写的原因
        let recordSetting: [String: Any] = [
            AVSampleRateKey: NSNumber(value: 16000),//采样率
            AVFormatIDKey: NSNumber(value: kAudioFormatLinearPCM),//音频格式
            AVLinearPCMBitDepthKey: NSNumber(value: 16),//采样位数
            AVNumberOfChannelsKey: NSNumber(value: 1),//通道数
            AVEncoderAudioQualityKey: NSNumber(value: AVAudioQuality.min.rawValue)//录音质量
        ];
        
        //开始录音
        do {
            let url = URL(fileURLWithPath: file_path!)
            recorder = try AVAudioRecorder(url: url, settings: recordSetting)
            recorder!.prepareToRecord()
            recorder!.record()
            print("开始录音")
        } catch let err {
            print("录音失败:\(err.localizedDescription)")
        }
    }
    
    
    //结束录音
    func stopRecord() -> Double {
        var duration:Double = 0
        if let recorder = self.recorder {
            if recorder.isRecording {
                print("正在录音，马上结束它，文件保存到了：\(file_path!)")
            }
            recorder.stop()
            self.recorder = nil
        }else {
            print("没有初始化")
        }
        do {
            // 录音时长
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: file_path!))
            duration = player!.duration
        } catch {}
        return duration
    }
    
    //播放
    func play() {
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: file_path!))
            print("歌曲长度：\(player!.duration)")
            player!.play()
        } catch let err {
            print("播放失败:\(err.localizedDescription)")
        }
    }
    
}

enum RecordStatus {
    case noStart
    case start
    case end
}

struct api_RecordSound: View {
    
    let recoder_manager = RecordManager()
    
    @State var duration: Double = 0
    @State var status: RecordStatus = .noStart
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "waveform.path")
                    
                Text("\(duration) 秒")
            }
            .offset(y: -40)
            
            if status == .noStart {
                Button(action: {
                    recoder_manager.beginRecord()
                    status = .start
                }, label: {
                    Image(systemName: "mic.fill")
                        .resizable()
                        .frame(width: 35, height: 50)
                })
            }
            
            if status == .start {
                Button(action: {
                    duration = recoder_manager.stopRecord()
                    status = .end
                }, label: {
                    Image(systemName: "waveform.and.mic")
                        .resizable()
                        .frame(width: 50, height: 50)
                })
            }
            
            if status == .end {
                HStack(spacing: 100) {
                    Button(action: {
                        recoder_manager.play()
                    }, label: {
                        Image(systemName: "play.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                    })
                    
                    Button(action: {
                        status = .noStart
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                    })
                }
            }
            
        }
        .padding()
        .navigationBarTitle("录音", displayMode: .inline)
    }
}

struct api_RecordSound_Previews: PreviewProvider {
    static var previews: some View {
        api_RecordSound()
    }
}
