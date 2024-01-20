//
//  UserDao.swift
//  SocialHelp
//
//  Created by yusuf bakır on 18.12.2023.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class UserManager {
    let  login : PublishSubject<Answer> = PublishSubject()
    let  signUp : PublishSubject<PersonAnswer> = PublishSubject()
    

   
  
    let service = APIwebService()
    
    func userSigin (signinPerson : Person) {
        let parameters : [String:Any] = [
            "email":signinPerson.email,
            "phone":signinPerson.phone,
            "password": signinPerson.password,
            "name": signinPerson.name,
            "surname": signinPerson.surname,
            "birthOfDateYear": signinPerson.birthOfYear,
            "identityNumber": signinPerson.identityNumber,
            "job": signinPerson.job]
       
        service.makeBodyRequest(url: Constants.EnPointURL.signUpPerson.rawValue, method:"POST", responseType: PersonAnswer.self, parameters: parameters, completion: {response in
            switch response {
            case .success(let data):
               self.signUp.onNext(data)
             
            case .failure(let error):
                debugPrint(error)
               
                
            }
        })
    
        
        
    }
    func userLogin (email:String,password:String)  {
    
        service.makeGetRequest(url:"http://localhost:8090/api/person/login?email=\(email)&password=\(password)" , responseType: Answer.self, completion: {response in
            
            switch response {
        
            case .success(let data) :
                self.login.onNext(data)
            case .failure(let error):
               debugPrint(error)
                
                
            
            }
            
        })
       
      
    }
   
    
}

 
