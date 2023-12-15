//
//  DonationModel.swift
//  SocialHelp
//
//  Created by yusuf bakır on 9.11.2023.
//

import Foundation
class Scholarship:StudentUser{
    var student:StudentUser
    var PDFdata :Data?
    var description :String?
    var department:String?
    
    init(student: StudentUser, PDFdata: Data? = nil, description: String? = nil, department: String? = nil) {
        self.student = student
        self.PDFdata = PDFdata
        self.description = description
        self.department = department
    }
    
}
