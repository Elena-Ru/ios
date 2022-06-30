//
//  AllGroupsController.swift
//  VKontakte
//
//  Created by Елена Русских on 20.06.2022.
//

import UIKit

class AllGroupsController: UITableViewController {
    
    var groups = [
    Group(name: "Healthy Meal", image: UIImage(named: "group1.jpeg")!),
    Group(name: "Recipes", image: UIImage(named: "group2.jpeg")!),
    Group(name: "Running", image: UIImage(named: "group3.jpeg")!),
    Group(name: "IOS developers", image: UIImage(named: "group4.jpeg")!),
    Group(name: "Batman Fan Club", image: UIImage(named: "group5.jpeg")!),
    Group(name: "Trip", image: UIImage(named: "group6.jpeg")!)
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! AllGroupsCell

        let group = groups[indexPath.row].name
        let image = groups[indexPath.row].image
        
        cell.GroupName.text = group
        cell.GroupImage.image = image

        return cell
    }
}
