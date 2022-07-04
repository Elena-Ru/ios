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
        collectionView.backgroundColor = UIColor(red: 24/255, green: 15/255, blue: 36/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
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
        //cell.backgroundColor = UIColor(red: 24/255, green: 15/255, blue: 36/255, alpha: 1)
            return cell
        }
}
