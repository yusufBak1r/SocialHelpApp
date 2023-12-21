//
//  StudentList.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.12.2023.
//

import Foundation

class StudentDao{

    let networkign = APIwebService()
    
    func StudentSignUP (student:Student) {
        let parametters: [String:Any] = [
            "email":student.user.email,
            "phone":student.user.phone,
            "password": student.user.password,
            "name": student.name,
            "surname": student.surname,
            "birthOfDateYear": student.birthOfDateYear,
            "identityNumber": student.identityNumber,
            "hasTranskript": student.hasTranskript,
            "scholarship": student.schorlarship]
        
        networkign.makeBodyRequest(url: "", method: "POST", parameters: parametters, completion: {response in
            
        })
        
    }
    func StudentLogin(Student:User) {
    networkign.makeGetRequest(url:"http://localhost:8090/api/student/login?email=\(Student.email)&password=\(Student.password)" , responseType: Answer.self, completion: { response in
            
        })
    }
    
//    func StudentTranscriptLoading(Transcript:TranskriptModel) {
//        let parametters: [String:Any] = [
//            "email":Transcript.student.name,
//            "phone":Transcript.student.user.phone,
//            "password": Transcript.student.user.password,
//            "name": Transcript.student.name,
//            "surname": Transcript.student.surname,
//            "birthOfDateYear": Transcript.student.birthOfDateYear,
//            "identityNumber": Transcript.student.identityNumber,
//            "hasTranskript": Transcript.student.hasTranskript]
//        networkign.makeBodyRequest(url: Constants.EnPointURL.StudentSignU.rawValue, method: <#T##String#>, parameters: <#T##[String : Any]#>, completion: <#T##(Result<Data, Error>) -> Void#>)
//        
//        
//    }
    
    
    
    
    
   
    
}
