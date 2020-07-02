//
//  UserService.swift
//  GitHubUserListExample
//
//  Created by Pinlun Huang on 2020/7/2.
//  Copyright © 2020 Pinlun Huang. All rights reserved.
//

import Foundation

typealias completionWithUsers = ([User]) -> Void
typealias completionWithError = (String) -> Void

class UserService: NSObject {

    static let instance = UserService()
    
    func getUserList(since: Int, page: Int, completion: @escaping completionWithUsers,fail: @escaping completionWithError) {
        let url = "/users?since=\(String(since))&per_page=20&page=\(String(page))"
        
        ApiService.instance.get(url: url) { (result, error) in
            
            if case .failure = error {
                fail("Get User List Error")
                return
            }
  
            let decoder = JSONDecoder()
            let baseModel = try? decoder.decode([UserCodable].self, from: result!)
            guard let model = baseModel else {
                fail("Get User List Error")
                return
            }
        
            var users = [User]()
            for u in model {
                let user = User(codable: u)
                users.append(user)
            }
            completion(users)
        }
    }
    
    
}
