//
//  StudentList.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.12.2023.
//

import Foundation
import RxSwift
import RxCocoa


protocol StudentManagerProtocol {
    
    func getAllStudent( complete: @escaping((StudentAnswer?, Error?)->()))
    func StudentSignUP (student:Student,parametters:[String:Any]?,complete:@escaping((StudentAnswerSignin?,Error?)->()))
    func transcriptDownload(id :Int,complete:@escaping((TranskirptAnswer?,Error?)->()))
    func transcriptLoading (base64:String,studentID:Int,term :String,complete:@escaping((Answer?,Error?)->()))
func scholarshipGive (amount:Int,statement:String,date:String,personID:Int,stutentID:Int,sholarShipeName:String,complete:@escaping((Answer?,Error?)->()))
    
}

class StudentManager{
    let networkign = APIwebService()
    static let shared = StudentManager()
   
    func StudentSignUP (parametters:[String:Any]?,student:Student,complete:@escaping((StudentAnswerSignin?,Error?)->())) {
        
        networkign.makeBodyRequest(url: Constants.EnPointURL.studentSignUp.rawValue, method: "POST", responseType: StudentAnswerSignin.self, parameters: parametters, completion: {response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error ):
                complete(nil, error)
                
            }

        })
        
    }
    
    

    func getAllStudent (complete: @escaping((StudentAnswer?, Error?)->())) {
        networkign.makeGetRequest(url: Constants.EnPointURL.studentGetAll.rawValue, responseType: StudentAnswer.self, completion: {response in
            
            
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error)
                
            }
           
            
        })
    }
    
    
    func transcriptLoading (base64:String,studentID:Int,term :String,complete:@escaping((Answer?,Error?)->())) {
       
        let params :[String:Any] = [
            "student":[
                "id":studentID],
            "term":term,
            "transcriptPdf":base64]
        self.networkign.makeBodyRequest(url: Constants.EnPointURL.Transkriptadd.rawValue, method: "POST", responseType: Answer.self, parameters: params, completion: { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error ):
                complete(nil, error)

            }


        })

    }
    func transcriptDownload(id :Int,complete:@escaping((TranskirptAnswer?,Error?)->())) {
        
        networkign.makeGetRequest(url: "http://localhost:8090/api/student/transcript/{id}?studentId=\(id)", responseType: TranskirptAnswer.self, completion: { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error ):
                complete(nil, error)

            }
            
            
        })
    }
   
        
        
    
    func scholarshipGive (amount:Int,statement:String,date:String,personID:Int,stutentID:Int,sholarShipeName:String,complete:@escaping((Answer?,Error?)->())) {
        networkign.makeBodyRequest(url: "http://localhost:8090/api/person/giveScholarsip?amount=\(amount)4&description=\(statement)&localDate=\(date)&name=\(sholarShipeName)&personId=\(personID)&studentId=\(stutentID)", method: "POST", responseType: Answer.self, parameters: nil, completion: {     response in
            
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error ):
                complete(nil, error)
            }
            
            
            
        })
    }
    
}

    
