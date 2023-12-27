//
//  StudentAnswerSignin.swift
//  SocialHelp
//
//  Created by yusuf bakır on 27.12.2023.
//

import Foundation
struct StudentAnswerSignin :Codable{
    let success: Bool
    let message: String
    let data: DatumStudent
    init(success: Bool, message: String, data: DatumStudent) {
        self.success = success
        self.message = message
        self.data = data
    }
    
}
 struct DatumStudent :Codable{
        let id :Int
        let identityNumber: String
        let hasTranskript: Bool
        let password: String
        let birthOfDateYear: Int
        let phone, name, surname: String
        let scholarship: Bool
        let email: String
     init(identityNumber: String, hasTranskript: Bool, password: String, birthOfDateYear: Int, phone: String, name: String, surname: String, scholarship: Bool, email: String,id:Int) {
        self.identityNumber = identityNumber
        self.hasTranskript = hasTranskript
        self.password = password
        self.birthOfDateYear = birthOfDateYear
        self.phone = phone
        self.name = name
        self.surname = surname
        self.scholarship = scholarship
        self.email = email
         self.id = id 
    }
    }
    


    

