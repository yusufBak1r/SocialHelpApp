//
//  PersonAnswer.swift
//  SocialHelp
//
//  Created by yusuf bakır on 19.12.2023.
//

import Foundation
struct PersonAnswer :Codable{
    
    var user:User
    var name:String
    var surame : String
    var birthOfDateYear : Int
    var identityNumber = UUID().uuidString
    var job :String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.user = try container.decode(User.self, forKey: .user)
        self.name = try container.decode(String.self, forKey: .name)
        self.surame = try container.decode(String.self, forKey: .surame)
        self.birthOfDateYear = try container.decode(Int.self, forKey: .birthOfDateYear)
        self.identityNumber = try container.decode(String.self, forKey: .identityNumber)
        self.job = try container.decode(String.self, forKey: .job)
    }
    
}
