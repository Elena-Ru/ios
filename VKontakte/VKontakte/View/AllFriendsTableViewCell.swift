//
//  AllFriendsTableViewCell.swift
//  VKontakte
//
//  Created by Елена Русских on 24.06.2022.
//

import UIKit

class AllFriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var AvatarShadow: UIView!
    
    
    @IBOutlet weak var FriendName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
