//
//  UserManager.swift
//  E-Ticketing
//
//  Created by Muhammad  Naveed on 24/08/2020.
//  Copyright © 2020 technerds. All rights reserved.
//

import Foundation

//MARK:-  handle  json respons data
struct UserManager {

    private var users: [UserModel] = []
    
    init() {
        self.users = Bundle.main.decode([UserModel].self, from: "Tour.json")
    }

    func getUsers() -> [UserModel] {
        return self.users
    }
}
