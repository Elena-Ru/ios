//
//  PhotoViewController.swift
//  VKontakte
//
//  Created by Елена Русских on 20.06.2022.
//

import UIKit

class PhotoViewController: UICollectionViewController {
    
    var friendPhoto = [PhotoUser?]()
    var friend: User?
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return friendPhoto.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoViewCell
            let image = friendPhoto[indexPath.item]
            cell.FriendPhoto.image = image?.photo
            cell.FriendPhoto.contentMode = .scaleAspectFill
            cell.ILikeControl.setPhotoUser(photo: image!, cellIndex: indexPath.item)
            return cell
        }
}
