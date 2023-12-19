//
//  SigninVC.swift
//  SocialHelp
//
//  Created by yusuf bakır on 8.11.2023.
//

import UIKit

class SigninVC: UIViewController {
    
    
    let fetch = UserDao()
 
    @IBOutlet var passwordTextFiled: UITextField!
    
    @IBOutlet var emailTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(imageName: "back.jpeg")
        // Do any additional setup after loading the view.
       
       
    }
    
    @IBAction func SigingButtom(_ sender: Any) {
       
        if let emailtext = emailTextFiled.text ,let passwordtext = passwordTextFiled.text {
            let a1 = User(email: emailtext, password: passwordtext, phohe: "11111111111")
            let a2 = Person(user: a1, name: "yusuf", surame: "bakır", birthOfDateYear: 2001, job: "yazılım")
           fetch.userSigin(signinPerson: a2)
           
        }
        
            
        }
    }
    
  

