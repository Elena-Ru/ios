//
//  AllGroupsCell.swift
//  VKontakte
//
//  Created by Елена Русских on 20.06.2022.
//

import UIKit

class AllGroupsCell: UITableViewCell {

    @IBOutlet weak var GroupName: UILabel!
    
    @IBOutlet weak var GroupImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
