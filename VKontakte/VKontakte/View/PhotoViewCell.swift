//
//  PhotoViewCell.swift
//  VKontakte
//
//  Created by Елена Русских on 20.06.2022.
//

import UIKit

class PhotoViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ILikeControl: LikePhotoControl!
   
    @IBOutlet weak var FriendPhoto: UIImageView!
    
    @IBOutlet var container: UIView!
    
    //индекс фото на которую нажали
    var photoIndex: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//       let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//       tap.numberOfTapsRequired = 1
//        ILikeControl.addGestureRecognizer(tap)
        //container.addGestureRecognizer(tap)
    }
    
}
