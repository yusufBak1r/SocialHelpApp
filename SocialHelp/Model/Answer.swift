//
//  UserAnswer.swift
//  SocialHelp
//
//  Created by yusuf bakır on 15.12.2023.
//

import Foundation

struct Answer:Codable{
    let success:Bool?
    let message : String?

    init(success: Bool?, message: String?) {
        self.success = success
        self.message = message
    }

}
