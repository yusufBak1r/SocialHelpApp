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
        
        networkign.makeBodyRequest(url: "", method: "POST", responseType: Answer.self, parameters: parametters, completion: {response in

        })
        
    }
    func StudentLogin(Student:User) {
    networkign.makeGetRequest(url:"http://localhost:8090/api/student/login?email=\(Student.email)&password=\(Student.password)" , responseType: Answer.self, completion: { response in
        
        })
    }

//    
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
//    
    
    
    
    func Transkriptfetch (base64:String) {
        let c  = User(email: "eiaieaie", password: "aemkkaei", phohe: "11111111111")
        let b = Student(user: c, name: "yusuf", surname: "bakır", birthOfDateYear: 2001, identityNumber: "", hasTranskript: false, schorlarship: false)
        let a1 = self.StudentSignUP(student:b )
        let params:[String:Any] = [
            "" :""
        
        
        ]
        networkign.makeBodyRequest(url: "http://localhost:8090/api/student/addTranscript", method: "POST", responseType: Answer.self, parameters: [:], completion: { response in
            
            
//            parametre olarak string pdf,term:String studentId:int
            
            
            
            
            
        })
        
    }
   
    
}
