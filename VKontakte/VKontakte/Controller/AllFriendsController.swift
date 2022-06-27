//
//  AllFriendsController.swift
//  VKontakte
//
//  Created by Елена Русских on 20.06.2022.
//

import UIKit

class AllFriendsController: UITableViewController {
    
    var friends = [
        User(name: "Ivan", image: [PhotoUser(image: UIImage(named: "friend1.jpeg")! ), PhotoUser(image: UIImage(named: "friend1_1.jpeg")! )]),
        User(name: "Oleg", image: [PhotoUser(image: UIImage(named: "friend2.jpeg")! )]),
        User(name: "Katya", image: [PhotoUser(image: UIImage(named: "friend3.jpeg")! ), PhotoUser(image: UIImage(named: "friend3_1.jpeg")!), PhotoUser(image: UIImage(named: "friend3_2.jpeg")!)]),
        User(name: "Olya", image: [PhotoUser(image: UIImage(named: "friend4.jpeg")! )]),
        User(name: "Sergey", image: [PhotoUser(image: UIImage(named: "friend5.jpeg")! )]),
        User(name: "Victoria", image: [PhotoUser(image: UIImage(named: "friend6.jpeg")! )]),
//        User(name: "Anastasia", image: UIImage(named: "friend7.jpeg")!),
//        User(name: "Vasiliy", image: UIImage(named: "friend8.jpeg")!),
//        User(name: "Nina", image: UIImage(named: "friend9.jpeg")!),
//        User(name: "Anna", image: UIImage(named: "friend10.jpeg")!)
    ]
    
    
   
    override func viewDidLoad() {
     super.viewDidLoad()

        tabBarItem.title = "Friends"
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableCell", for: indexPath) as! AllFriendsTableViewCell

        let image = friends[indexPath.row].image
        let name = friends[indexPath.row].name
    
        cell.FriendName.text = name

        for subView in cell.AvatarShadow.subviews{
            if subView is UIImageView{
                let imageView = subView as! UIImageView
                imageView.image = image[0].photo
            }
        }
        
        // Configure the cell...

        return cell
    }
    
    // Передаем Title и фото
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showPhoto",
           let destinationVC = segue.destination as? PhotoViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let friendName = friends[indexPath.row].name
            let photo = friends[indexPath.row].image
            destinationVC.title = friendName
            destinationVC.friendPhoto = photo
            destinationVC.friend = friends[indexPath.row]
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
