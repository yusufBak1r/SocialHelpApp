//
//  StudentAnswer.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.12.2023.
//

import Foundation
struct StudentAnswer :Codable{
  
        let success: Bool
        let message: String
        let data: [Datum]
    init(success: Bool, message: String, data: [Datum]) {
        self.success = success
        self.message = message
        self.data = data
    }
    }
    
    
struct Datum:Codable {
  
        let id: Int
        let email, phone, password, name: String
        let surname: String
        let birthOfDateYear: Int
        let identityNumber: String
        let hasTranskript, scholarship: Bool
        init(id: Int, email: String, phone: String, password: String, name: String, surname: String, birthOfDateYear: Int, identityNumber: String, hasTranskript: Bool, scholarship: Bool) {
            self.id = id
            self.email = email
            self.phone = phone
            self.password = password
            self.name = name
            self.surname = surname
            self.birthOfDateYear = birthOfDateYear
            self.identityNumber = identityNumber
            self.hasTranskript = hasTranskript
            self.scholarship = scholarship
        }
    }
    
    

