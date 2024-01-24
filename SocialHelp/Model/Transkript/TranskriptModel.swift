//
//  TranskriptModel.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.12.2023.
//

import Foundation
class TranskriptModel {
//    Post --- Get --
    var studentID : Int?
    let term : String
    let trancriptPdf:String

    init(student: Int, term: String, trancriptPdf: String) {
        self.studentID = student
        self.term = term
        self.trancriptPdf = trancriptPdf
    
    }
    
}

