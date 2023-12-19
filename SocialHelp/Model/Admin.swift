//
//  Admin.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.12.2023.
//

import Foundation
// Get Post Put
class Admin {
    var user: User
    let permission :String
    init(user: User, permission: String) {
        self.user = user
        self.permission = permission
    }
    
   
}
