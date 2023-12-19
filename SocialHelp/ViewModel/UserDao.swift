//
//  UserDao.swift
//  SocialHelp
//
//  Created by yusuf bakır on 18.12.2023.
//

import Foundation
import Alamofire
class UserDao {
    
    let service = APIwebService()
    
    func userLogin (email:String,password:String) {
        service.makeGetRequest(url:"http://localhost:8090/api/person/login?email={email}&password={password}" , responseType: Answer.self, completion: {response in
            
        })
        
    }
    
    
    func userSigin (signinPerson : Person) {
        let parameters : [String:Any] = [
            "email":signinPerson.user.email,
            "phone":signinPerson.user.phone,
            "password": signinPerson.user.phone,
            "name": signinPerson.name,
            "surname": signinPerson.surame,
            "birthOfDateYear": signinPerson.birthOfDateYear,
            "identityNumber": signinPerson.identityNumber,
            "job": signinPerson.job]
        print(parameters)
        service.makeBodyRequest(url: Constants.EnPointURL.signUpPerson.rawValue, method:"POST", parameters: parameters, completion: {response in
                
        })
        
        
        
    }
    func adminSignUp (admins:Admin) {
        let parametters : [String:Any] = [
            "email": admins.user.email,
            "phone": admins.user.phone,
            "password": admins.user.password,
        
        ]
        service.makeBodyRequest(url: Constants.EnPointURL.adminSignUp.rawValue, method: "POST", parameters: parametters, completion: { response in
            
      
            
        })
        
    }
    
}
