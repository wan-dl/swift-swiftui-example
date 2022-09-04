//
//  p_Shake.swift 设备摇晃
//  HelloSwift
//
//  Created by 1 on 9/4/22.
//

import SwiftUI

extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

// 覆盖默认手势
extension UIWindow {
     open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
     }
}

struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}

// 震动
struct Haptics {
    static func hapticSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

struct p_Shake: View {
    
    var body: some View {
        VStack {
            Image("shake")
                .resizable()
                .frame(width: 64, height: 64)
                .onShake {
                    Haptics.hapticSuccess()
                }
            
            Text("摇动手机")
                .font(.callout)
        }
        .navigationTitle("Shake - 摇动")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct p_Shake_Previews: PreviewProvider {
    static var previews: some View {
        p_Shake()
    }
}
