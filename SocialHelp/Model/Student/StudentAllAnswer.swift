//
//  StudentAnswer.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.12.2023.
//

import Foundation
struct StudentAnswerAll :Codable{
  
        let success: Bool
        let message: String
        let data: [DatumStudent]?
    init(success: Bool, message: String, data: [DatumStudent]) {
        self.success = success
        self.message = message
        self.data = data
    }
    }
    
