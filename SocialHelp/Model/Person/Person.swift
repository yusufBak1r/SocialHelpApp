//
//  Person.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.12.2023.
//

import Foundation
//  burs verecek kişi  --- Post -- Get  kulanıcı kayıt olucak kişi
class Person :Codable,Identifiable,UserProtocol{
    var user: User
    var name:String
    var surame : String
    var birthOfDateYear : Int
    var identityNumber = 0
    var job :String
    
    init(user: User, name: String, surame: String, birthOfDateYear: Int, job: String) {
      
        self.name = name
        self.surame = surame
        self.birthOfDateYear = birthOfDateYear
        self.job = job
        self.user = user
        
    }
   
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.user = try container.decode(User.self, forKey: .user)
        self.name = try container.decode(String.self, forKey: .name)
        self.surame = try container.decode(String.self, forKey: .surame)
        self.birthOfDateYear = try container.decode(Int.self, forKey: .birthOfDateYear)
        self.identityNumber = try container.decode(Int.self, forKey: .identityNumber)
        self.job = try container.decode(String.self, forKey: .job)
    }
   
    
    
}
