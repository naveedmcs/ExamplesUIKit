//
//  RidersVC.swift
//  E-Ticketing
//
//  Created by Muhammad  Naveed on 24/08/2020.
//  Copyright © 2020 technerds. All rights reserved.
//

import UIKit

class RidersVC: UIViewController {

    //MARK:- outllets
    @IBOutlet private weak var tableView: UITableView!
   
    //MARK:- variables
    var userList: [UserModel] = []
    private var userManager = UserManager()
    
    //MARK:- life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Select Rider"
        self.userList = userManager.getUsers()
    }
    
   
}

//MARK:- tableView datasource
extension RidersVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "MyTableViewCell")
        let item = userList[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = item.userType
        cell.detailTextLabel?.text = item.subtext
        return cell
    }

}

//MARK:- tableView daelegate
extension RidersVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = userList[indexPath.row]
        let storyboard = UIStoryboard.get(.main)
        let vc = storyboard.instantiateViewController(identifier: FaresVC.className) as! FaresVC
        vc.user = user
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


