//
//  UserDetailViewController.swift
//  GitHubUserListExample
//
//  Created by Pinlun Huang on 2020/7/2.
//  Copyright © 2020 Pinlun Huang. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var bioLbl: UILabel!
    @IBOutlet weak var loginLbl: UILabel!
    @IBOutlet weak var adminLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var blogLbl: UILabel!
    
    let loadingIndicator = LoadingViewController()
    let userViewModel = UserViewModel()
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "User: \(userName ?? "")"
        self.navigationController?.navigationBar.topItem?.title = ""
        userViewModel.delegate = self
        configAdminLabel()
        configRoundAvatar()
        
        showLoading()
        userViewModel.requestSpecificUser(username: userName ?? "")
    }
    
    //MARK: - View Config
    
    func configAdminLabel(){
        adminLbl.textColor = UIColor.white
        adminLbl.layer.masksToBounds = true
        adminLbl.layer.cornerRadius = 15
    }
    
    func configRoundAvatar(){
        avatarImg.layer.borderWidth = 1.0
        avatarImg.layer.masksToBounds = false
        avatarImg.layer.borderColor = UIColor.white.cgColor
        avatarImg.layer.cornerRadius = avatarImg.frame.size.width / 2
        avatarImg.clipsToBounds = true
    }
    
    func configUser(user: User) {
        nameLbl.text = user.name
        bioLbl.text = user.bio
        loginLbl.text = user.login
        adminLbl.text = user.siteAdmin! ? "ADMIN":"STAFF"
        adminLbl.backgroundColor = user.siteAdmin! ? #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1):#colorLiteral(red: 0.3685780466, green: 0.4235700369, blue: 0.8234271407, alpha: 1)
        locationLbl.text = user.location
        blogLbl.text = user.blog
        
        let imageUrl = URL(string: user.avatarUrl!)
        avatarImg.kf.setImage(with: imageUrl)
    }
    
    //MARK: - Loading Indicator
    
    func showLoading() {
        DispatchQueue.main.async {
            self.createSpinnerView()
        }
    }
    
    func removeLoading() {
        DispatchQueue.main.async {
            self.loadingIndicator.willMove(toParent: nil)
            self.loadingIndicator.view.removeFromSuperview()
            self.loadingIndicator.removeFromParent()
        }
    }
    
    func createSpinnerView() {
        addChild(loadingIndicator)
        loadingIndicator.view.frame = view.frame
        view.addSubview(loadingIndicator.view)
        loadingIndicator.didMove(toParent: self)
    }

}

//MARK: - UserViewModelDelegate

extension UserDetailViewController: UserViewModelDelegate {
    func retrievedSpecificUser() {
        DispatchQueue.main.async {
            self.configUser(user: self.userViewModel.specificUser!)
            self.removeLoading()
        }
    }
    
    func updatedUserList() {
        
    }
    
    func showAlert(msg: String) {
        print(msg)
    }
}
