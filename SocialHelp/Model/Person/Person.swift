//
//  Person.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.12.2023.
//

import Foundation
//  burs verecek kişi  --- Post -- Get  kulanıcı kayıt olucak kişi
class Person :UserProtocol,Codable,Identifiable{
    var user:User
    var name:String
    var surame : String
    var birthOfDateYear : Int
    var identityNumber = UUID().uuidString
    var job :String
    
    init(user: User, name: String, surame: String, birthOfDateYear: Int, job: String) {
        self.user = user
        self.name = name
        self.surame = surame
        self.birthOfDateYear = birthOfDateYear
        self.job = job
    }
   
    
   
    
    
}
