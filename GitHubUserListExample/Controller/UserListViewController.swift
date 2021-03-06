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
    var page: Int = 1
    var clickedUserRow: Int = 0
    @IBOutlet weak var userListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "GitHub Users"
        userViewModel.delegate = self
        userListTableView.delegate = self
        userListTableView.dataSource = self
        
        if userViewModel.userList.isEmpty {
            self.showLoading()
        }
        
        userViewModel.requestUserData(page: page)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "GitHub Users"
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
    
    //MARK: - Segue Prepare
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SpecificUserSegue {
            let userDetailVC = segue.destination as! UserDetailViewController
            userDetailVC.userName = self.userViewModel.userList[self.clickedUserRow].login
        }
    }
}

//MARK: - UserViewModelDelegate

extension UserListViewController: UserViewModelDelegate {
    func retrievedSpecificUser() {
        
    }
    
    func updatedUserList() {
        DispatchQueue.main.async {
            self.removeLoading()
            self.userListTableView.reloadData()
        }
    }
    
    func showAlert(msg: String) {
        print(msg)
    }
}

//MARK: UITableViewDelegate

extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.clickedUserRow = indexPath.row
        self.performSegue(withIdentifier: SpecificUserSegue, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == userViewModel.userList.count - 10 {
            if self.userViewModel.userList.count < 100 {
                self.page += 1
                self.userViewModel.requestUserData(page: page)
            }
        }
    }
}

//MARK: - UITableViewDataSource

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserCell
        cell.configUser(user: userViewModel.userList[indexPath.row])
        return cell
    }
}

