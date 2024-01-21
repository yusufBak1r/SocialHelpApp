//
//  UserViewModel.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.01.2024.
//

import Foundation
import RxSwift
import RxCocoa
class UserViewModel {
    let  login : PublishSubject<Answer> = PublishSubject()
    let  signUp : PublishSubject<PersonAnswer> = PublishSubject()
    
    func userSinginUp(signinPerson:Person) {
        let parameters : [String:Any] = [
            "email":signinPerson.email,
            "phone":signinPerson.phone,
            "password": signinPerson.password,
            "name": signinPerson.name,
            "surname": signinPerson.surname,
            "birthOfDateYear": signinPerson.birthOfYear,
            "identityNumber": signinPerson.identityNumber,
            "job": signinPerson.job]
        UserManager.shared.userSigin(parameters: parameters, complete: {[weak self]data,error  in
            
            if let error = error {
                print(error)
            }else {
                self?.signUp.onNext(data!)
            }
            
            
        })
    }
    func loginPerson (email:String,password:String){
        UserManager.shared.userLogin(email: email, password: password, complete: {[weak self]data,error  in
            if let error = error {
                print(error)
                
            }else {
            
                self?.login.onNext(data!)
            }
            
            
            
        })
    }
    
    
    
    
    
    
    
}
