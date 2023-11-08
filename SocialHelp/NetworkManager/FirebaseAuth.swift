//
//  FirebaseAuth.swift
//  SocialHelp
//
//  Created by yusuf bakır on 8.11.2023.
//

import Foundation
import FirebaseAuth
import UIKit
class Firebaselogin {
    func creatUser(email:String,password:String) {
        if email != nil  && password != nil {
            Auth.auth().createUser(withEmail: email, password: password) {authdata,error in
                if error != nil {
                    UIView().addAlert(title: "OK", message: "\(error?.localizedDescription)")
                }else {
                    
                }
            }
            
        }
       
    }
    
    
}
