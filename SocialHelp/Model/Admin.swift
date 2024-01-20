//
//  Admin.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.12.2023.
//

import Foundation
// Get Post Put
class Admin:User {

    let permission :String
    init( permission: String, email: String, password: String, phone: String) {

        self.permission = permission
        super.init(email: email, phone: phone, password: password)
    }
    
   
}
