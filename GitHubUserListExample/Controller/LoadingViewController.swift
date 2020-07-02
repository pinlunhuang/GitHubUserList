//
//  LoadingViewController.swift
//  GitHubUserListExample
//
//  Created by Pinlun Huang on 2020/7/2.
//  Copyright © 2020 Pinlun Huang. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    var loading = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    let loadingLbl: UILabel = {
        let loadingText = UILabel()
        loadingText.text = "Loading"
        loadingText.textColor = .white
        loadingText.textAlignment = .center
        loadingText.font.withSize(20)
        return loadingText
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func loadView() {
        loading.color = .white
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        loading.translatesAutoresizingMaskIntoConstraints = false
        loadingLbl.translatesAutoresizingMaskIntoConstraints = false
        loading.startAnimating()
        view.addSubview(loading)
        view.addSubview(loadingLbl)
        
        loading.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loading.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10).isActive = true
        
        loadingLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingLbl.topAnchor.constraint(equalTo: loading.bottomAnchor, constant: 10).isActive = true
        
    }

}
