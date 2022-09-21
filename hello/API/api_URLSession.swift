//
//  api_URLSession.swift
//  HelloSwift
//
//  Created by 1 on 8/4/22.
//


import SwiftUI

struct UserData: Codable {
    var name: String
    var age: Int
    var createTime: String
}


struct api_URLSession: View {
    
    @EnvironmentObject var network: NetworkMonitor
    
    @State var res = UserData(name: "", age: 0, createTime: "")
    @State var resString = ""
    @State var isNetworkError: Bool = false
    @State var isResponsekError: Bool = false
    @State var responseMessage: String = ""
    
    let url: String = "https://vkceyugu.cdn.bspapp.com/VKCEYUGU-0c1fa337-7340-4755-9bec-f766d7d31833/9aecd01a-f061-49e0-964e-fa165a96c620.json"
    
    var body: some View {
        Form {
            Section("网络请求响应") {
                TextEditor(text: $resString)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: 200)
            }
            
            Button("发起Get请求") {
                getRequests()
            }
            .alert("网络不可用，请检查网络连接", isPresented: $isNetworkError) {}
            .alert(responseMessage, isPresented: $isResponsekError) {}
        }
        .navigationTitle("URLSession")
        .modifier(navBarViewCodeAndDocs(pageType: "API",pageID: "URLSessionGet"))
    }
    
    func getRequests() {
        // 检查网络是否处于可用
        if !network.isActive {
            self.isNetworkError.toggle()
            return
        }
        
        guard let url = URL(string: self.url) else {return}
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 20
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        
        session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                self.isResponsekError.toggle()
                if (error as? URLError)?.code == .timedOut {
                    responseMessage = "网络请求超时，请检查网络"
                } else {
                    responseMessage = "网络请求出错, \(String(describing: error))"
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200 ..< 530) ~= response.statusCode else { return }
            if response.statusCode != 200 {
                self.isResponsekError.toggle()
                responseMessage = "Error: HTTP请求失败 \(response.statusCode)"
                return
            }
            
            do {
                if let decodedResponse = try? JSONDecoder().decode(UserData.self, from: data!) {
                    DispatchQueue.main.async {
                        self.res = decodedResponse
                        self.resString = String(data: data!, encoding: String.Encoding.utf8)!
                    }
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}

struct api_URLSession_Previews: PreviewProvider {
    static var previews: some View {
        api_URLSession()
    }
}
