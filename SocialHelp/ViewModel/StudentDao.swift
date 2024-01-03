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
    
    let  studentData : PublishSubject<StudentAnswer> = PublishSubject()
    let  studentSignUp : PublishSubject<StudentAnswerSignin> = PublishSubject()
    let isloading : PublishSubject<Bool> = PublishSubject()
    let transcript : PublishSubject<Answer> = PublishSubject()
    let trancsriptGett: PublishSubject<TranskirptAnswer> = PublishSubject()
    let scholarShipe :PublishSubject<Answer> = PublishSubject()
    
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
       
        
        networkign.makeBodyRequest(url: Constants.EnPointURL.studentSignUp.rawValue, method: "POST", responseType: StudentAnswerSignin.self, parameters: parametters, completion: {response in
            switch response {

            case .success(let data):
                self.studentSignUp.onNext(data)
             
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
                print(StudentAnswer.self)
            case .failure(let error):
            print(error)
                
            }
           
            
        })
    }
    
    
    func transcriptLoading (base64:String,studentID:Int,term :String) {
       
        let params :[String:Any] = [
            "student":[
                "id":studentID],
            "term":term,
            "transcriptPdf":base64]
        self.networkign.makeBodyRequest(url: Constants.EnPointURL.Transkriptadd.rawValue, method: "POST", responseType: Answer.self, parameters: params, completion: { response in
            switch response {
            case .success(let data):
                print(data)
            case .failure(let error ):
                print(error)

            }


        })

    }
    func transcriptDownload(id :Int) {
        
        networkign.makeGetRequest(url: "http://localhost:8090/api/student/transcript/{id}?studentId=\(id)", responseType: TranskirptAnswer.self, completion: { response in
            switch response {
            case .success(let data):
                self.trancsriptGett.onNext(data)
            case .failure(let error ):
                print(error)

            }
            
            
        })
    }
   
        
        
    
    func scholarshipGive (amount:Int,statement:String,date:String,personID:Int,stutentID:Int,sholarShipeName:String) {
        networkign.makeBodyRequest(url: "http://localhost:8090/api/person/giveScholarsip?amount=\(amount)4&description=\(statement)&localDate=\(date)&name=\(sholarShipeName)&personId=\(personID)&studentId=\(stutentID)", method: "POST", responseType: Answer.self, parameters: [:], completion: {     response in
            
            switch response {
            case .success(let data):
                self.scholarShipe.onNext(data)
            case .failure(let error ):
                print(error)
            }
            
            
            
            
            
            
            
        })
    }
    
}

    
