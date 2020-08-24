//
//  FaresVC.swift
//  E-Ticketing
//
//  Created by Muhammad  Naveed on 24/08/2020.
//  Copyright © 2020 technerds. All rights reserved.
//

import UIKit

class FaresVC: UIViewController {

    
    //Mark:-  outlets
    @IBOutlet private weak var tableView: UITableView!
    
    //Mark:- variables
    var user: UserModel?
    
    private var userManager = UserManager()
    
    //Mark:-  life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Select Fare"
        self.tableView.tableFooterView = UIView()
    }
    
    
}
//MARK:-  tableview data source
extension FaresVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user?.fares?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "MyTableViewCell")
        let item = user?.fares?[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = item?.fareDescription
        cell.detailTextLabel?.text = item?.priceFormatted
    
        return cell
    }
    
}
//MARK:-  tableview delegate
extension FaresVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fare = user?.fares?[indexPath.row]
        let storybaord = UIStoryboard.get(.main)
        let vc = storybaord.instantiateViewController(identifier: BuyTicketVC.className) as! BuyTicketVC
        vc.selectedfare = fare
        vc.selectedUser = user
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
