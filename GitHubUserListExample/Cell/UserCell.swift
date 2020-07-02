//
//  UserCell.swift
//  GitHubUserListExample
//
//  Created by Pinlun Huang on 2020/7/2.
//  Copyright © 2020 Pinlun Huang. All rights reserved.
//

import UIKit
import Kingfisher

class UserCell: UITableViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var loginLbl: UILabel!
    @IBOutlet weak var adminLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configAdminLabel()
        configRoundAvatar()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
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
        loginLbl.text = user.login
        adminLbl.text = user.siteAdmin! ? "ADMIN":"STAFF"
        adminLbl.backgroundColor = user.siteAdmin! ? #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1):#colorLiteral(red: 0.3685780466, green: 0.4235700369, blue: 0.8234271407, alpha: 1)
        
        let imageUrl = URL(string: user.avatarUrl!)
        avatarImg.kf.setImage(with: imageUrl)
    }

}
