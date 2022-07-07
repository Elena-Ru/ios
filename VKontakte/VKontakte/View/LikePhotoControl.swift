//
//  LikePhotoControl.swift
//  VKontakte
//
//  Created by Елена Русских on 27.06.2022.
//

import UIKit

class LikePhotoControl: UIControl {
    
    var photoUser: PhotoUser!
    let likeCount  = UILabel(frame: CGRect(x: 0, y: -5, width: 50, height: 50))
    let likeButton = UIButton(frame: CGRect(x: 10, y: -5, width: 50, height: 50))
    let likePhoto: UIImage? = nil
    func setPhotoUser(photo : PhotoUser, cellIndex: Int) {
        photoUser = photo
        likeCount.text = String(photo.likeCount)
        setLikeButton(isLike: photo.isLike)
        likeCount.textColor = photo.isLike ? .systemRed : .systemBlue
        addSubview(likeButton)
        addSubview(likeCount)
    }
    
    func setLikeButton(isLike: Bool) {
        if isLike{
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = .systemRed
        }else {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = .lightGray
        }
    }
}
