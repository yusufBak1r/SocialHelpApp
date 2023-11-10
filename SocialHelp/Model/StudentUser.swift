//
//  StudentUser.swift
//  SocialHelp
//
//  Created by yusuf bakır on 9.11.2023.
//

import Foundation
class StudentUser:Identifiable {
    var studentID = UUID().uuidString
    var name : String?
    var lastname : String?
    var identificationNumber: Int?
    var email : String?
    var password:String?
    
    init(studentID: String = UUID().uuidString, name: String? = nil, lastname: String? = nil, identificationNumber: Int? = nil, email: String? = nil, password: String? = nil) {
        self.studentID = studentID
        self.name = name
        self.lastname = lastname
        self.identificationNumber = identificationNumber
        self.email = email
        self.password = password
    }
    
}
