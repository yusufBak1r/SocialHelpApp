//
//  StudentList.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.12.2023.
//

import Foundation
import RxSwift
import RxCocoa

class StudentDao{
    
    var  studentData : PublishSubject<StudentAnswer> = PublishSubject()
    
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
        
        networkign.makeBodyRequest(url: Constants.EnPointURL.signUpPerson.rawValue, method: "POST", responseType: StudentAnswer.self, parameters: parametters, completion: {response in
            switch response {
            case .success(let data):
                self.studentData.onNext(data)
            case .failure(let error ):
                print(error)
                
            }

        })
        
    }
    
    

    func getAllStudent () {
        networkign.makeGetRequest(url: Constants.EnPointURL.studentGetAll.rawValue, responseType: StudentAnswer.self, completion: {response in
            
            
            switch response {
            case .success(let data):
                self.studentData.onNext(data)
            case .failure(let error):
            print(error)
                
            }
            
            
        })
    }
    
    
    
    
   
    
}
//
//    func Transkriptfetch (base64:String,studentID:StudentAnswer) {
//
//
//        networkign.makeBodyRequest(url: "http://localhost:8090/api/student/addTranscript", method: "POST", responseType: Answer.self, parameters: [:], completion: { response in
//
//            switch response {
//            case .success(let data):
//                print(data)
//            case .failure(let error ):
//                print(error)
//
//            }
//
//
//
//
//
//        })
//
//    }
