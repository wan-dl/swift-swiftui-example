//
//  ViewButton.swift
//  format
//
//  Created by 1 on 7/27/22.
//

import SwiftUI

// 设置 section header样式
extension View {
    fileprivate func sectionTitle() -> some View {
        self.font(.title3.bold())
            .frame(maxWidth: .infinity)
            .frame(height: 66, alignment: .bottomLeading)
    }
}

struct v_Button: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("介绍：Button, 常用的控件，可以通过.buttonStyle()，设置按钮样式。本页面演示了按钮样式效果")
                    .font(.callout)
                    .foregroundColor(.gray)
                    .frame(height: 66)
                
                Section(header: Text(".buttonStyle() 所有设置效果展示").sectionTitle()) {
                    Divider()
                    
                    Button("默认 样式按钮", action: {})
                    
                    Button("Plain 样式按钮", action: {})
                        .buttonStyle(.plain)
                    
                    Button(".bordered 样式按钮", action: {})
                        .buttonStyle(.bordered)
                    
                    Button(".borderless 样式按钮", action: {})
                        .buttonStyle(.borderless)
                    
                    Button(".borderedProminent 样式按钮", action: {})
                        .buttonStyle(.borderedProminent)
                }
                
                Section(header: Text(".buttonStyle() + .controlSize()").sectionTitle()) {
                    Divider()
                    
                    Button(".large 按钮", action: {})
                        .controlSize(.large)
                        .buttonStyle(.bordered)
                    
                    Button(".regular 按钮", action: {})
                        .controlSize(.regular)
                        .buttonStyle(.bordered)
                    
                    Button(".small 按钮", action: {})
                        .controlSize(.small)
                        .buttonStyle(.bordered)
                    
                    Button(".mini 按钮", action: {})
                        .controlSize(.mini)
                        .buttonStyle(.bordered)
                }
                
                Section(header: Text( "常见其它按钮样式").sectionTitle()) {
                    Divider()
                    Button(action: {}, label: {
                        HStack {
                           Image(systemName: "star")
                           Text("带有SF符号的按钮")
                        }.padding()
                    })
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Button("带有缩放效果的按钮", action: {})
                        .buttonStyle(withScaleEffectButtonStyle())
                    
                    
                    Button(action: {}, label: {
                        Label("渐变效果按钮", systemImage: "plus")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(15.0)
                    })
                }
            }
            .padding()
        }
        .navigationTitle("Button")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Button"))
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 50)
         })
    }
}

// 点击带有缩放效果的按钮
struct withScaleEffectButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .foregroundColor(.white)
                .padding()
        }
        .background(.blue)
        .cornerRadius(10)
        .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct v_Button_Previews: PreviewProvider {
    static var previews: some View {
        v_Button()
    }
}
