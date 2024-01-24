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
protocol UserManagerProtocol {
    func userSigin (parameters:[String:Any]?,complete: @escaping((PersonAnswer?, Error?)->()))
    func userLogin (email:String,password:String,complete: @escaping((PersonAnswer?, Error?)->()))
}

class UserManager:UserManagerProtocol {
    
   static let shared = UserManager()
    let service = APIwebService()
    
    func userSigin (parameters:[String:Any]?,complete: @escaping((PersonAnswer?, Error?)->())) {
       
        service.makeRequest(url: Constants.EnPointURL.signUpPerson.rawValue, method:"POST", responseType: PersonAnswer.self, parameters: parameters, completion: {response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil,error)
               
                
            }
        })
                
    }
    
    func userLogin (email:String,password:String,complete: @escaping((PersonAnswer?, Error?)->()))  {
    
        service.makeRequest(url:  "http://localhost:8090/api/person/login?email=\(email)&password=\(password)", method: "GET", responseType: PersonAnswer.self, parameters: nil, completion: { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil,error)
            }
            
        })
      
    }
   
    
}

        
                
