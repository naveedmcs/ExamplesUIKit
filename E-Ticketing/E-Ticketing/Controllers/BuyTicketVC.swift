//
//  BuyTicketVC.swift
//  E-Ticketing
//
//  Created by Muhammad  Naveed on 24/08/2020.
//  Copyright © 2020 technerds. All rights reserved.
//

import UIKit

class BuyTicketVC: UIViewController {

   //MARK:- outlets
    @IBOutlet private weak var itemTitle: UILabel!
    @IBOutlet private weak var itemDetail: UILabel!
    @IBOutlet private weak var stepper: UIStepper!
    @IBOutlet private weak var buybtn: UIButton!
    
   //MARK:- variables
    var selectedfare: Fare?
    var selectedUser: UserModel?
    private var totalTickets = 1
    private var totalPrice: Double = 0
    
    //MARK:- life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Confirm Selection"
        self.totalPrice = selectedfare?.price ?? 0
        self.renderView()
         
    }
    
    private func renderView()  {
        self.itemTitle.text = selectedUser?.userType
        self.itemDetail.text = selectedfare?.fareDescription
        let btnTitle = "Buy \(totalTickets) Tickets - $\(totalPrice)"
        self.buybtn.setTitle(btnTitle, for: .normal)
    }
    
    //MARK:-  actions
    @IBAction private func stepperDidTapp(_ sender: UIStepper) {
        self.totalTickets = Int(sender.value)
        guard let farePrice = selectedfare?.price else {
            print("Selected Fare price not found")
            return
        }
        
        self.totalPrice = sender.value * farePrice
        self.renderView()
    }
    
    
    @IBAction private func buyBtndidTap(sender: UIButton) {
        self.confirmationAlert("Are you sure! to want further proceed?") {
            self.present( title: "Congratulations", message: "Tickets has been purchased"){
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }

    

}

