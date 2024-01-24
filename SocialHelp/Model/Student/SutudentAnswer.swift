//
//  StudentAnswerSignin.swift
//  SocialHelp
//
//  Created by yusuf bakır on 27.12.2023.
//

import Foundation
struct StudentAnswer :Codable{
    let success: Bool
    let message: String
    let data: DatumStudent?
    init(success: Bool, message: String, data: DatumStudent) {
        self.success = success
        self.message = message
        self.data = data
    }
    
}
 struct DatumStudent :Codable{
        let id :Int
        let email: String
        let identityNumber: String
        let password: String
        let birthOfDateYear: Int
        let phone, name, surname: String
        let scholarship: Bool
      let hasTranskript: Bool
       
     init(identityNumber: String, hasTranskript: Bool, password: String, birthOfDateYear: Int, phone: String, name: String, surname: String, scholarship: Bool, email: String,id:Int) {
        self.id = id
        self.identityNumber = identityNumber
        self.hasTranskript = hasTranskript
        self.password = password
        self.birthOfDateYear = birthOfDateYear
        self.phone = phone
        self.name = name
        self.surname = surname
        self.scholarship = scholarship
        self.email = email
      
    }
     init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
         self.id = try container.decode(Int.self, forKey: .id)
         self.email = try container.decode(String.self, forKey: .email)
         self.identityNumber = try container.decode(String.self, forKey: .identityNumber)
         self.password = try container.decode(String.self, forKey: .password)
         self.birthOfDateYear = try container.decode(Int.self, forKey: .birthOfDateYear)
         self.phone = try container.decode(String.self, forKey: .phone)
         self.name = try container.decode(String.self, forKey: .name)
         self.surname = try container.decode(String.self, forKey: .surname)
         self.scholarship = try container.decode(Bool.self, forKey: .scholarship)
         self.hasTranskript = try container.decode(Bool.self, forKey: .hasTranskript)
     }
    }
    


    

