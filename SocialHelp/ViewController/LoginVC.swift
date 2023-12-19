//
//  ViewController.swift
//  SocialHelp
//
//  Created by yusuf bakır on 6.11.2023.
//

import UIKit

class ViewController: UIViewController {

    let fetch = UserDao()
    @IBOutlet weak var PswrdTextfiled: UITextField!
    @IBOutlet weak var mailTextfiled: UITextField!
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setBackgroundImage(imageName: "back.jpeg")
    }
    
    @IBAction func loginButtom(_ sender: Any) {
        
        if let emailtext = mailTextfiled.text ,let passwordtext = PswrdTextfiled.text {
//            
//         let a  = User(email:emailtext , password: passwordtext, phohe: "11111111111")
//            let a1 = Admin(user: a, permission: "")
            
            
       fetch.userLogin(email: emailtext, password: passwordtext)
            
            
            
//          fetch.adminSignUp(admins: a1)
        }
        
        
    }
    
    @IBAction func segmentedAction(_ sender: Any) {
        
        if (sender as AnyObject).selectedSegmentIndex == 0 {
            print ("ilk segmented açıldı ")
    }
        if (sender as AnyObject).selectedSegmentIndex == 1 {
         print("ikinci segment açıldı ")
            performSegue(withIdentifier: "toSignin", sender: nil)
        }
        
        
        
    }
}
