//
//  urlRequest.swift
//  HelloSwift
//
//  Created by 1 on 8/25/22.
//

import SwiftUI
import Swift
import Network

public enum URLSessionAsyncErrors: Error {
    case invalidUrlResponse, missingResponseData
}

public extension URLSession {
    func asyncFunc(from url: URL) async throws -> (Data, URLResponse) {
        return try await withCheckedThrowingContinuation { continuation in
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                guard let response = response as? HTTPURLResponse else {
                    continuation.resume(throwing: URLSessionAsyncErrors.invalidUrlResponse)
                    return
                }
                guard let data = data else {
                    continuation.resume(throwing: URLSessionAsyncErrors.missingResponseData)
                    return
                }
                continuation.resume(returning: (data, response))
            }
            task.resume()
        }
    }
}
