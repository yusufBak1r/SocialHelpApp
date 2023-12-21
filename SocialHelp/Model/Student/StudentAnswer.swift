//
//  StudentAnswer.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.12.2023.
//

import Foundation
struct StudentAnswer :Codable,UserProtocol{
    var id : Int
    var user: User
    let  name : String
    let surname : String
    let birthOfDateYear :Int
    let identityNumber:String
    let hasTranskript : Bool
    let schorlarship:Bool
    init(id: Int, user: User, name: String, surname: String, birthOfDateYear: Int, identityNumber: String, hasTranskript: Bool, schorlarship: Bool) {
        self.id = id
        self.user = user
        self.name = name
        self.surname = surname
        self.birthOfDateYear = birthOfDateYear
        self.identityNumber = identityNumber
        self.hasTranskript = hasTranskript
        self.schorlarship = schorlarship
    }
    
}
