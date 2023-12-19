//
//  Constants.swift
//  SocialHelp
//
//  Created by yusuf bakır on 29.11.2023.
//

import Foundation
class Constants {
    
    
    
    enum EnPointURL :String, CodingKey {
        case loginPerson = "http://localhost:8090/api/person/login?email={email}&password={password}" // Pesron
        case signUpPerson = "http://localhost:8090/api/person/signUp" //Peson signUp
        case adminSignUp = "http://localhost:8090/api/admin/signUp"
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
