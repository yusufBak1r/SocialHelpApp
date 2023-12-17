//
//  StudentUser.swift
//  SocialHelp
//
//  Created by yusuf bakır on 9.11.2023.
//

import Foundation
 // Post --Get -- öğrenci bursa başvuran transkript yükleyen 
class Student:Codable,UserProtocol{
    var user: User
    let  name : String
    let surname : String
    let birthOfDateYear :Int
    let identityNumber:String
    let hasTranskript : Bool
    let schorlarship:Bool
    init(user: User, name: String, surname: String, birthOfDateYear: Int, identityNumber: String, hasTranskript: Bool, schorlarship: Bool) {
        self.user = user
        self.name = name
        self.surname = surname
        self.birthOfDateYear = birthOfDateYear
        self.identityNumber = identityNumber
        self.hasTranskript = hasTranskript
        self.schorlarship = schorlarship
    }
 
    
}
