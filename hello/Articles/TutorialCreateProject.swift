//
//  TutorialCreateProject.swift
//  HelloSwift
//
//  Created by 1 on 9/10/22.
//

import SwiftUI

fileprivate let steps_1_cp = """
iOS开发之前，您首先需要1台Mac电脑。

在电脑上，打开App Store.app，搜索Xcode，点击获取安装。
Xcode软件体积很大，安装速度取决于您的网络。安装完成后，在电脑上找到Xcode，点击启动。
"""

fileprivate let steps_2_cp = ""

struct TutorialCreateProject: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Group {
                    Text(steps_1_cp)
                }
                
                Group {
                    Divider()
                    Text("第一步：如下图所示，点击:") + Text("Create a new Xcode Project").bold()
                    
                    Image("create_project_1")
                        .resizable()
                        .frame(height: 200)
                        .cornerRadius(10)
                }
                
                Group {
                    
                    Divider()
                    Text("第2步：点击 Create a new Xcode Project 后，出现如下界面，选择") + Text(" App ").bold() + Text("或其它Application类型，然后点击底部按钮 ") + Text("Next").bold().foregroundColor(.blue)
                    
                    Image("create_project_2")
                        .resizable()
                        .frame(height: 260)
                        .cornerRadius(10)
                }
                
                Group {
                    Divider()
                    Text("第3步：如下图，填写") + Text("Product Name、Team、Organization Identifier").bold() + Text("。Interface和Language等其它项默认即可。填写后，点击底部按钮 ") + Text("Next").bold().foregroundColor(.blue)
                    Image("create_project_3")
                        .resizable()
                        .frame(height: 250)
                        .cornerRadius(10)
                }
                
                Group {
                    Divider()
                    Text("项目创建后，Xcode显示界面如下：")
                    
                    Image("create_project_4")
                        .resizable()
                        .frame(height: 200)
                        .cornerRadius(10)
                    
                    Text("此时，将iPhone设备，连接到电脑上，然后按下快捷键Command+R，即可在手机预览。")
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.1))
        .navigationTitle("新建项目")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TutorialCreateProject_Previews: PreviewProvider {
    static var previews: some View {
        TutorialCreateProject()
    }
}
