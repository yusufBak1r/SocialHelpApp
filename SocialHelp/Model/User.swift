//
//  User.swift
//  SocialHelp
//
//  Created by yusuf bakır on 8.11.2023.
//

import Foundation
class User :Identifiable ,Codable{
    var uuid = UUID().uuidString
    var email:String?
    var password:String?
    init(email:String,password:String){
        self.email = email
        self.password = password
    }
    
}

