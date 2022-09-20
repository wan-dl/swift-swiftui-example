//
//  p_navigation.swift
//  format
//
//  Created by 1 on 7/29/22.
//

import SwiftUI

// 修改当前视图导航栏背景颜色
struct NavigationBarStyle<S: ShapeStyle>: ViewModifier {
    private var bgStyle: S
    private var viewBackgroundColor: Color
    
    init(_ bgStyle: S, viewBackgroundColor: Color) {
        self.bgStyle = bgStyle
        self.viewBackgroundColor = viewBackgroundColor
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Color(UIColor.systemBackground)
                .ignoresSafeArea(.all, edges: .bottom)
            
            content
        }
        .background(bgStyle)
    }
}

extension View {
    func navigationBarColorForCurrent<S: ShapeStyle>(_ bgStyle: S, viewBackgroundColor: Color = Color(UIColor.systemBackground)) -> some View {
        modifier(NavigationBarStyle(bgStyle, viewBackgroundColor: viewBackgroundColor))
    }
}

struct p_navigationBar: View {
    
    @State var isActive = false
    @State var navBarBgColor: Color = .blue
    @State var navBarFgColor: Color = .white
    
    // dismiss方法 适用于 iOS 15.0+
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("请注意，导航栏左边和右边按钮。")
            
            // 适用于13.0 ~ 16.0
            if #unavailable(iOS 16.0) {
                NavBar_13_16
            } else {
                NavBar_16
            }
            
            Divider()
            
            Button("改变导航栏颜色为红色", action: {
                self.isActive.toggle()
                self.navBarBgColor = self.isActive ? .red : .blue
            }).buttonStyle(PrimaryBtnStyle())
            
        }
        .padding()
        .navigationBarColorForCurrent(navBarBgColor)
        .navigationBarBackButtonHidden(true)
        
    }
    
    @available (iOS, introduced: 13.0, deprecated: 16.0, message: "此方法仅仅适用于13.0~16.0")
    var NavBar_13_16: some View {
        Text("")
            .navigationBarItems(
                leading: Button(action: {
                    self.dismiss()
                }) {
                    Text("< 返回").foregroundColor(navBarFgColor)
                },
                trailing:
                    Button(action: {}) {
                        Text("分享").foregroundColor(navBarFgColor)
                    }
            )
    }
    
    @available (iOS 16.0, *)
    var NavBar_16: some View {
        Text("")
            .navigationBarItems(
                leading: Button(action: {
                    self.dismiss()
                }) {
                    Text("< 返回").foregroundColor(navBarFgColor)
                },
                trailing:
                    Button(action: {}) {
                        Label("分享", systemImage: "square.and.arrow.up").foregroundColor(navBarFgColor)
                    }
            )
            .toolbar(.hidden, for: .navigationBar)
    }
}


struct p_navigationBar_Previews: PreviewProvider {
    static var previews: some View {
        p_navigationBar()
    }
}
