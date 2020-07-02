//
//  APIService.swift
//  GitHubUserListExample
//
//  Created by Pinlun Huang on 2020/7/2.
//  Copyright © 2020 Pinlun Huang. All rights reserved.
//

import Foundation
import Alamofire

typealias completionHandler = (Data?,NetworkError) -> Void


enum NetworkError: Error {
    case warning
    case failure
    case success
}

class ApiService: NSObject {
    static let instance = ApiService()
    
    func get(url:String,completion:@escaping completionHandler) {
        
        let url = api_url + url
        let params: Parameters = [:]

        AF.request(url, parameters: params).responseJSON { (response) in
            guard let json = response.data else {
                completion(nil,.failure)
                return
            }
            completion(json,.success)
        }
    }
}
