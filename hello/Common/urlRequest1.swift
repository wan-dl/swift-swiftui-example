//
//  urlRequest.swift
//  HelloSwift
//
//  Created by 1 on 8/25/22.
//

import SwiftUI
import Swift
import Network

enum NetworkError: String {
    case notNetwork = "无网络，请检查网络设置"
    case urlInvalid = "URL无效"
    case httpStatusCodeError = "HTTP状态码错误"
    case codeRunException = "代码运行异常"
}

public func urlGet(url: String, resType: String = "json") async -> [String:Any] {
    var result: Dictionary<String, Any> = ["status": false, "message": "" ]
    
    guard let url = URL(string: url) else {
        result["message"] = NetworkError.urlInvalid.rawValue
        return result
    }
    
    do {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            result["message"] = NetworkError.httpStatusCodeError.rawValue
            return result
        }
        
        if data == data {
            result["status"] = true
            if (resType == "json") {
                result["data"] = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            } else if (resType == "str") {
                result["data"] = data
            } else {
                result["data"] = String(data: data, encoding: .utf8)!
            }
        }
    } catch let error {
        print(error)
        result["message"] = NetworkError.codeRunException.rawValue
    }
    return result
}
