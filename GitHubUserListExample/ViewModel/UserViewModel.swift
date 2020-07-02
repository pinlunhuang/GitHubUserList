//
//  UserViewModel.swift
//  GitHubUserListExample
//
//  Created by Pinlun Huang on 2020/7/2.
//  Copyright © 2020 Pinlun Huang. All rights reserved.
//

import UIKit

protocol UserViewModelDelegate {
    
    func updatedUserList()
    func retrievedSpecificUser()
    func showAlert(msg:String)
    
}

class UserViewModel: NSObject {

    var delegate: UserViewModelDelegate?
    var userList = [User]()
    var specificUser: User?
    
    
    func requestUserData(page: Int) {

        UserService.instance.getUserList(since: userList.last?.id ?? 0, page: page, completion: { (users) in
            
            self.userList.append(contentsOf: users)
            self.delegate?.updatedUserList()
            
        }) { (error) in
            
            self.delegate?.showAlert(msg: error)
            
        }
    }
    
    func requestSpecificUser(username: String) {

        UserService.instance.getSpecificUser(username: username, completion: {
            (user) in
            
            self.specificUser = user
            self.delegate?.retrievedSpecificUser()
            
        }) { (error) in
            
            self.delegate?.showAlert(msg: error)
        }
    }
}
