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
    
    override func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTapsRequired = 1
        container.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_: UITapGestureRecognizer){
        
        if ILikeControl.photoUser.isLike {
            ILikeControl.photoUser.likeCount -= 1
            ILikeControl.likeCount.text = String(ILikeControl.photoUser.likeCount)
            ILikeControl.likeCount.textColor = .systemBlue
              } else {
                  ILikeControl.photoUser.likeCount += 1
                  ILikeControl.likeCount.text = String(ILikeControl.photoUser.likeCount)
                  ILikeControl.likeCount.textColor = .systemRed
               }
        ILikeControl.photoUser.isLike.toggle()
        ILikeControl.setLikeButton(isLike: ILikeControl.photoUser.isLike)
    }
    
}
