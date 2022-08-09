//
//  api_URLSession.swift
//  HelloSwift
//
//  Created by 1 on 8/4/22.
//

// docs: https://juejin.cn/post/6844903917621346317

import SwiftUI

struct UserData: Codable {
    var name: String
    var age: Int
    var createTime: String
}


struct api_URLSession: View {
    @State var res = UserData(name: "", age: 0, createTime: "")
    @State var resString = ""
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TextEditor(text: $resString)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(height: 200)
                .background(Color.gray.opacity(0.25))
            
            Button(action: {
                getUserInfo()
            }, label: {
                Label("发起请求（Get）", image: "")
            })
            .buttonStyle(PrimaryBtnStyle())
            .offset(y: 20)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.1))
        .navigationBarTitle("URLSession", displayMode: .inline)
    }
    
    func getUserInfo() {
        let url:String = "https://vkceyugu.cdn.bspapp.com/VKCEYUGU-0c1fa337-7340-4755-9bec-f766d7d31833/9aecd01a-f061-49e0-964e-fa165a96c620.json"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            if error != nil {
                print("::...... 网络请求出错\(String(describing: error))")
                return
            }
            do {
                if let decodedResponse = try JSONDecoder().decode(UserData.self, from: data!)  {
                    DispatchQueue.main.async {
                        self.res = decodedResponse
                        
                        let rawJson = try? JSONSerialization.jsonObject(with:data!)
                        let result = try? JSONSerialization.data(withJSONObject: rawJson, options: [])
                        self.resString = String(data: result!, encoding: String.Encoding.utf8)!
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
