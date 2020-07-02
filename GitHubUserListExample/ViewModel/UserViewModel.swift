//
//  UserViewModel.swift
//  GitHubUserListExample
//
//  Created by Pinlun Huang on 2020/7/2.
//  Copyright © 2020 Pinlun Huang. All rights reserved.
//

import UIKit

protocol UserViewModelDelegate {
    
    func updateView()
    func showAlert(msg:String)
    
}

class UserViewModel: NSObject {

    var delegate: UserViewModelDelegate?
    var dataSource = [User]()
    
    func fetchData() {
        
        UserService.instance.getUserList(completion: { (users) in
            
            self.dataSource = users
            self.delegate?.updateView()
            
        }) { (errorMsg) in
            
            self.delegate?.showAlert(msg: errorMsg)
            
        }
    }
    
    
    
}
