//
//  Person.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.12.2023.
//

import Foundation
//  burs verecek kişi  --- Post -- Get
class Person :UserProtocol,Codable{
    var user:User
    var name:String
    var surame : String
    var birthOfDateYear : Int
    var identityNumber :String
    var job :String
    
    init(user: User, name: String, surame: String, birthOfDateYear: Int, identityNumber: String, job: String) {
        self.user = user
        self.name = name
        self.surame = surame
        self.birthOfDateYear = birthOfDateYear
        self.identityNumber = identityNumber
        self.job = job
    }
   
    
   
    
    
}
