//
//  ViewController.swift
//  GitHubUserListExample
//
//  Created by Pinlun Huang on 2020/7/1.
//  Copyright © 2020 Pinlun Huang. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {

    let loadingIndicator = LoadingViewController()
    let userViewModel = UserViewModel()
    @IBOutlet weak var userList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userViewModel.delegate = self
        userList.delegate = self
        userList.dataSource = self
        
        if userViewModel.dataSource.isEmpty {
            self.showLoading()
        }
        
        userViewModel.requestUserData()
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

extension UserListViewController: UserViewModelDelegate {
    func updateView() {
        DispatchQueue.main.async {
            self.removeLoading()
            self.userList.reloadData()
        }
    }
    
    func showAlert(msg: String) {
        
    }
}

//MARK: UITableViewDelegate

extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

//MARK: - UITableViewDataSource

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserCell
        cell.configUser(user: userViewModel.dataSource[indexPath.row])
        return cell
    }
}

