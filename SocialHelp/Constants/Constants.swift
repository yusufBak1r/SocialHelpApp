//
//  Constants.swift
//  SocialHelp
//
//  Created by yusuf bakır on 29.11.2023.
//

import Foundation
class Constants {
    
    
    
    enum Url :String, CodingKey {
        case BaseUrl = "eaaae"
        case StudentBase = "aeaeae"
        case UserUrl = "ae"
        case Scholarship = "ğıağr"
    }
    
    
    
    
    
    
    enum APIError: Error {
        case networkError
        case invalidResponse
        case serverError(statusCode: Int)
        case authenticationError
        // Diğer olası hata durumlarını buraya ekleyebilirsiniz
    }

}
