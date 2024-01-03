//
//  Constants.swift
//  SocialHelp
//
//  Created by yusuf bakır on 29.11.2023.
//

import Foundation
class Constants {
    
    
    
    enum EnPointURL :String, CodingKey {
        case loginPerson = "http://localhost:8090/api/person/login?email={email}&password={password}" // person login
        case signUpPerson = "http://localhost:8090/api/person/signUp" //person signUp
        case adminSignUp = "http://localhost:8090/api/admin/signUp" // admin kayıt ekranı
        case studentGetAll = "http://localhost:8090/api/student/getall" // tüm öğrencileri getirme
        case Transkriptadd = "http://localhost:8090/api/student/addTranscript" // öğrenci transcriptini yükleme
        case studentSignUp = "http://localhost:8090/api/student/signUp"
        case scholarship = "http://localhost:8090/api/scholarship/getAll" // verilen tüm bursları getirir
        case TranskriptGet = "http://localhost:8090/api/student/transcript/{id}?studentId={}"
case scholarshipGive = "http://localhost:8090/api/person/giveScholarsip?amount=344&description=leimklm%C3%BCkieml&localDate=2001-07-07&name=a%C3%A7%C4%B1z%20halaaaaqalalalala&personId=18&studentId=84"
        
    }
    enum APIError: Error {
        case networkError
        case invalidResponse
        case serverError(statusCode: Int)
        case authenticationError
        
        // Diğer olası hata durumlarını buraya ekleyebilirsiniz
    }

}
