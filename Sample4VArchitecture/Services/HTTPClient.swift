//
//  HTTPClient.swift
//  Sample4VArchitecture
//
//  Created by Paweł Trojan on 28/03/2020.
//  Copyright © 2020 Paweł Trojan. All rights reserved.
//

import Foundation

protocol HTTPClientType: class {
    func get(at url: URL, completionHandler: @escaping (Data) -> Void)
    func cancel()
}

final class HTTPClient {
    
    private let session = URLSession(configuration: .default, delegate: nil, delegateQueue: nil)
    private var dataTask: URLSessionDataTask?
    
    func get(at url: URL, completionHandler: @escaping (Data) -> Void) {
        
        dataTask = session.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            completionHandler(data)
        }
        dataTask?.resume()
    }
    
    func cancel() {
        dataTask?.cancel()
    }
}

extension HTTPClient: HTTPClientType {}
