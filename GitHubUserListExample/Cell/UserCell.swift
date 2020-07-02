//
//  UserCell.swift
//  GitHubUserListExample
//
//  Created by Pinlun Huang on 2020/7/2.
//  Copyright © 2020 Pinlun Huang. All rights reserved.
//

import UIKit

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
        adminLbl.backgroundColor = #colorLiteral(red: 0.3685780466, green: 0.4235700369, blue: 0.8234271407, alpha: 1)
        adminLbl.layer.cornerRadius = 5
    }
    
    func configRoundAvatar(){
        avatarImg.layer.borderWidth = 1.0
        avatarImg.layer.masksToBounds = false
        avatarImg.layer.borderColor = UIColor.white.cgColor
        avatarImg.layer.cornerRadius = avatarImg.frame.size.width / 2
        avatarImg.clipsToBounds = true
    }

}
