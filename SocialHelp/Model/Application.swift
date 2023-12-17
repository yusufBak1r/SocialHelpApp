//
//  Application.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.12.2023.
//

import Foundation
struct Application :Codable{
    var Student :Int
    var Schoolarship:Int
    var isAproved : Bool
    init(Student: Int, Schoolarship: Int, isAproved: Bool) {
        self.Student = Student
        self.Schoolarship = Schoolarship
        self.isAproved = isAproved
    }
    
    
}
