//
//  TutorialDeveloperAccount.swift
//  HelloSwift
//
//  Created by 1 on 9/10/22.
//

import SwiftUI

fileprivate let introduction = """
如果您希望完整的开发App，并分发App到 Apple Store。那么您就需要注册加入 Apple Developer Program。

相比较以前，现在开发者账号申请已经变得非常简单。

但是本人，在注册过程中，仍遇到了一些问题，在此记录。

当然，注册时，您必须有台iPhone或iPad设备。

特别注意：注册中途不要更换到其它设备，您必须在整个注册流程中使用相同的设备。

1. 首先，您需要注册一个Apple ID，这很容易注册，在iPhone、iPad、MacOSX，或Apple官网都很容易注册。注册时，姓氏、名字等信息，请正确填写，后面会用到。

2. 在iPhone或iPad上，登录Apple ID, 并启用触控ID、或面容ID、或锁屏密码。并为Apple ID 启用双重认证。您的设备上登录 iCloud。

3. 在AppStore应用商店，安装Apple Developer App

4. 启动Apple Developer App。

5. 点击“帐户”标签页，并使用Apple ID 登录。

6. “账户”标签页，点击”注册“，根据提示一步步操作，填写信息。

7. 特别注意：填写个人资料时，请输入与身份证一致的的姓氏、名字、身份证号码，请勿随意输入，否则会导致无法顺利注册。

8. 选择账号类型。如果是个人开发就选择个人，公司的话就选择组织；

9. 拍摄自拍照。

10. 检查并确认提交的信息，完成付费（目前，个人开发者一年是￥688.00），可以使用支付宝、微信、银联等多种方式支付。
"""

struct TutorialDeveloperAccount: View {
    @State var textInfo: AttributedString = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(textInfo)
                    .lineSpacing(6.0)
                    .textSelection(.enabled)
                Spacer()
            }
            .padding()
            .onAppear() {
                setTextStyle()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.1))
        .navigationTitle("Apple开发者账户教程")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func setTextStyle() {
        var tmp = AttributedString(introduction)
        
        if let range = tmp.range(of: "特别注意：注册中途不要更换到其它设备，您必须在整个注册流程中使用相同的设备。") {
            tmp[range].underlineStyle = .single
            tmp[range].font = .headline
        }
        
        if let range = tmp.range(of: "特别注意：填写个人资料时，请输入与身份证一致的的姓氏、名字、身份证号码，请勿随意输入，否则会导致无法顺利注册。") {
            tmp[range].underlineStyle = .single
            tmp[range].font = .headline
        }
            
        self.textInfo = tmp
    }
}

struct TutorialDeveloperAccount_Previews: PreviewProvider {
    static var previews: some View {
        TutorialDeveloperAccount()
    }
}
