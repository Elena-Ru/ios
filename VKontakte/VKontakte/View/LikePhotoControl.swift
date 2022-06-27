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
    
    func setPhotoUser( photo : PhotoUser, cellIndex: Int)
    {
        photoUser = photo
        likeCount.text = String(photo.likeCount)
        likeButton.tag = cellIndex
        likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        setLikeButton(isLike: photo.isLike)
        likeCount.textColor = photo.isLike ? .systemRed : .systemBlue
        addSubview(likeCount)
        addSubview(likeButton)
    }
    
    func setLikeButton(isLike: Bool){
        if isLike{
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = .systemRed
        }else {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = .lightGray
        }
    }
    
    @objc private func likeButtonPressed(sender:UIButton)
    {
        if photoUser.isLike {
                  photoUser.likeCount -= 1
                  likeCount.text = String(photoUser.likeCount)
                  likeCount.textColor = .systemBlue
              } else {
                   photoUser.likeCount += 1
                   likeCount.text = String(photoUser.likeCount)
                   likeCount.textColor = .systemRed
               }
        photoUser.isLike.toggle()
        setLikeButton(isLike: photoUser.isLike)
    }
}
