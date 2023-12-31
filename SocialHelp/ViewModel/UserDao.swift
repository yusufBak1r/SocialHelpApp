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
class UserDao {
//    Observer (Gözlemci) Deseni
//    Bir nesnenin durumu değiştiğinde, ona bağlı olan diğer nesnelerin haberdar olmasını sağlar.
    let  login : PublishSubject<Answer> = PublishSubject()
    let  signUp : PublishSubject<PersonAnswer> = PublishSubject()
    

   
  
    let service = APIwebService()
    
    func userSigin (signinPerson : Person) {
        let parameters : [String:Any] = [
            "email":signinPerson.user.email,
            "phone":signinPerson.user.phone,
            "password": signinPerson.user.password,
            "name": signinPerson.name,
            "surname": signinPerson.surame,
            "birthOfDateYear": signinPerson.birthOfDateYear,
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

 
