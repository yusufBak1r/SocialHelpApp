//
//  Person.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.12.2023.
//

import Foundation
//  burs verecek kişi  --- Post -- Get  kulanıcı kayıt olucak kişi
class Person: User {
    var id : Int = 0
    var name: String
    var surname: String
    var birthOfYear: Int
    var identityNumber = 0
    var job: String
    
    init(name: String, surname: String, birthOfYear: Int, job: String, email: String, password: String, phone: String) {
       
        self.name = name
        self.surname = surname
        self.birthOfYear = birthOfYear
        self.job = job
        super.init(email: email, phone: phone, password: password)
    }
}
