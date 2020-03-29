//
//  UsersListInteractor.swift
//  Sample4VArchitecture
//
//  Created by Paweł Trojan on 28/03/2020.
//  Copyright © 2020 Paweł Trojan. All rights reserved.
//

import Foundation

final class UsersListInteractor {
    
    private let httpClient: HTTPClientType

    init(httpClient: HTTPClientType = HTTPClient()) {
        self.httpClient = httpClient
    }

    func fetchUsers(completion: @escaping ([UserModel]) -> Void) {

        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            completion([])
            return
        }
        let httpCompletionHandler: (Data) -> Void = { data in
            let decoder = JSONDecoder()
            guard let users = (try? decoder.decode([UserModel].self, from: data)) else {
                completion([])
                return
            }
            completion(users)
        }
        httpClient.get(at: url, completionHandler: httpCompletionHandler)
    }
}
