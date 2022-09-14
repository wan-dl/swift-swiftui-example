//
//  api_URLSession_Post.swift
//  HelloSwift
//
//  Created by 1 on 8/5/22.
//

import SwiftUI

struct api_URLSession_Post: View {
    
    @EnvironmentObject var network: NetworkMonitor
    
    @State var errorMsg: String = ""
    @State var reqString: String = "简体字"
    @State var resString: String = ""
    
    @State var showAlert: Bool = false
    
    @State var isNetworkError: Bool = false
    @State var isResponsekError: Bool = false
    @State var responseMessage: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack {
                TextEditor(text: $reqString)
                    .frame(height: 100)
                    .cornerRadius(10)
                    .onChange(of: reqString, perform: { newValue in
                        let tmp = self.reqString.trimmingCharacters(in: .whitespacesAndNewlines)
                        if tmp.isEmpty {
                            self.resString = ""
                        }
                    })
                    
                
                Label("简体转繁体", systemImage: "arrow.down")
                    .foregroundColor(.black)
                
                TextEditor(text: $resString)
                    .cornerRadius(10)
                    .frame(height: 100)
            }
            
            Button(action: {
                let tmp = self.reqString.trimmingCharacters(in: .whitespacesAndNewlines)
                if tmp.isEmpty {
                    self.showAlert.toggle()
                } else {
                    if !network.isActive {
                        self.isNetworkError.toggle()
                    } else {
                        apiPost()
                    }
                }
            }, label: {
                Label("发起网络请求(POST)", systemImage: "")
            })
            .buttonStyle(PrimaryBtnStyle())
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("提示"),
                    message: Text("转换的内容不能为空"),
                    dismissButton: .default(Text("我知道了"))
                )
            }
            .toast(isShow: $isNetworkError, info: "网络不可用，请检查网络连接")
            .toast(isShow: $isResponsekError, info: responseMessage)
            
            if !(self.errorMsg.isEmpty) {
                Text(self.errorMsg)
                    .foregroundColor(.pink)
            }
            
            Spacer()
        }
        .padding()
        .background(.gray.opacity(0.1))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("URLSession POST")
    }
    
    func apiPost() {
        let url:String = "https://0c1fa337-7340-4755-9bec-f766d7d31833.bspapp.com/swift_URLSession"
        
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("identity_id=6ec449b87898412abf21c2fbbb8dd14b; sign=MTY4NDU0NTQ4NC43MjQ1OTM2OmM3NDNlYTMxODQyYWJiZWZlODI5MDA3NTE2N2NkZjE0NjUxMDQzZGYxNmQ1MzhiYTcxNzQ4NGJmZjYwZTE1Zjg=", forHTTPHeaderField: "Cookie")
        
        var body = ["content": "恭喜发财", "language": "繁体", "data_type": "content"]
        body.updateValue(self.reqString, forKey: "content")
        
        let bodyData = try? JSONSerialization.data(
            withJSONObject: body,
            options: []
        )
        request.httpBody = bodyData
        
        session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                self.isResponsekError.toggle()
                responseMessage = "网络请求出错, \(String(describing: error))"
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200 ..< 530) ~= response.statusCode else { return }
            if response.statusCode != 200 {
                self.isResponsekError.toggle()
                responseMessage = "Error: HTTP请求失败 \(response.statusCode)"
                return
            }
            
            var serverString: String = ""
            var errorMessage: String = ""
            do {
                let rawJson = try? JSONSerialization.jsonObject(with:data!, options: .mutableContainers)
                if rawJson == nil {
                    return
                }
                    
                let res = rawJson as! NSDictionary
                let statusCode = res["status"]
                
                if statusCode != nil && statusCode as! Int == 20000 {
                    serverString = res["content"] != nil ? res["content"] as! String : ""
                    if serverString == "" {
                        errorMessage = "出错了"
                    }
                } else {
                    errorMessage = res["msg"] != nil ? res["msg"] as! String : "出错了"
                }
            } catch {
                errorMessage = error as! String
            }
            
            DispatchQueue.main.async {
                self.resString = serverString
                self.errorMsg = errorMessage
            }
            
        }.resume()
    }
}

struct api_URLSession_Post_Previews: PreviewProvider {
    static var previews: some View {
        api_URLSession_Post()
    }
}
