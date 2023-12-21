//
//  TranskriptModel.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.12.2023.
//

import Foundation
class TranskriptModel {
//    Post --- Get --
    let id : Int = 0
    var  student : Student
    let term : String
    let trancriptPdf:String
    init(student: Student, term: String, trancriptPdf: String) {
        self.student = student
        self.term = term
        self.trancriptPdf = trancriptPdf
    }
    
}
