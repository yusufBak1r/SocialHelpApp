//
//  DonationModel.swift
//  SocialHelp
//
//  Created by yusuf bakır on 9.11.2023.
//

import Foundation
class Scholarship:StudentUser{
    var student:StudentUser
    var transcriptURL :String?
    var description :String?
    var department:String?
    
    init(student: StudentUser, transcriptURL: String? = nil, description: String? = nil, department: String? = nil) {
        self.student = student
        self.transcriptURL = transcriptURL
        self.description = description
        self.department = department
    }
    
}
