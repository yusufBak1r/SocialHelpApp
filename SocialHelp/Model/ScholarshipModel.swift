//
//  DonationModel.swift
//  SocialHelp
//
//  Created by yusuf bakır on 9.11.2023.
//

import Foundation
// burs eklemek için Post -- Get -- Update 
struct Scholarship{
    let id :Int
    let name:String
    let description:String
    let amount : Int
    let applicationDate : String
    let person : Person
    let student:Student
    let full :Bool
    init(id: Int, name: String, description: String, amount: Int, applicationDate: String, person: Person, student: Student, full: Bool) {
        self.id = id
        self.name = name
        self.description = description
        self.amount = amount
        self.applicationDate = applicationDate
        self.person = person
        self.student = student
        self.full = full
    }

    
   
}
