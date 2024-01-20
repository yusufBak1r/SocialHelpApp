//
//  StudentUser.swift
//  SocialHelp
//
//  Created by yusuf bakır on 9.11.2023.
//

import Foundation


class Student:User{
    let id : Int = 0
    let name : String
    let surname : String
    let birthOfDateYear :Int
    let identityNumber:String
    let hasTranskript : Bool
    let schorlarship:Bool
    init( name: String, surname: String, birthOfDateYear: Int, identityNumber: String, hasTranskript: Bool, schorlarship: Bool,email: String, phone: String, password: String) {
      
        self.name = name
        self.surname = surname
        self.birthOfDateYear = birthOfDateYear
        self.identityNumber = identityNumber
        self.hasTranskript = hasTranskript
        self.schorlarship = schorlarship
        super.init(email: email, phone: phone, password: password)
    }
 
    
}
