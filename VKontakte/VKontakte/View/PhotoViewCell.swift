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
            self.ILikeControl.likeCount.textColor = .systemBlue
            animateLikeCountAppear()
            } else {
                  
                ILikeControl.photoUser.likeCount += 1
                ILikeControl.likeCount.textColor = .systemRed
                animateLikeCountAppear()
                rotateLikeCount()
                gruopanimation()
               }
        ILikeControl.photoUser.isLike.toggle()
        ILikeControl.setLikeButton(isLike: ILikeControl.photoUser.isLike)
    }
    
    func animateLikeCountAppear(){
        UIView.transition(with: ILikeControl.likeCount,
                          duration: 0.5,
                          options: .transitionFlipFromRight) { [self] in
            self.ILikeControl.likeCount.text = String(ILikeControl.photoUser.likeCount)
    }
    }
    
    func rotateLikeCount() {
            let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotation.toValue = NSNumber(value: Double.pi * 2)
            rotation.duration = 1
            rotation.isCumulative = true
            rotation.repeatCount = 1
            ILikeControl.likeCount.layer.add(rotation, forKey: "rotationAnimation")
        }
    
    func gruopanimation(){
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime() + 0.5
        groupAnimation.duration = 0.5

        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.fromValue = 3.5
        scaleDown.toValue = 1.0
        let rotate = CABasicAnimation(keyPath: "transform.rotation")
        rotate.fromValue = .pi/10.0
        rotate.toValue = 0.0
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.fromValue = 0.0
        fade.toValue = 1.0

        groupAnimation.animations = [scaleDown, rotate,fade]
        ILikeControl.likeButton.layer.add(groupAnimation, forKey: nil)
    }
    
}
