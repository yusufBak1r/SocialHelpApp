//
//  ViewController.swift
//  SocialHelp
//
//  Created by yusuf bakır on 6.11.2023.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
   
    let fetch = UserDao()
    let fetchStudent =  StudentDao()
    let disposeBag = DisposeBag()
    @IBOutlet weak var PswrdTextfiled: UITextField!
    @IBOutlet weak var mailTextfiled: UITextField!
    
    @IBOutlet var activity: UIActivityIndicatorView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetch.error.observe(on: MainScheduler.asyncInstance).subscribe({ error in
            let message =  self.addAlert(title: "UYARI", message: error.element!)
            self.present(message, animated: true, completion: nil)
        }).disposed(by: disposeBag)
        
        setBackgroundImage(imageName: "back.jpeg")
    }
    
    @IBAction func loginButtom(_ sender: Any) {
        
        if mailTextfiled.text != "" && PswrdTextfiled.text != "" {
            
            if let email = mailTextfiled.text ,let password = PswrdTextfiled.text {
                fetch.userLogin(email: email, password: password)
             
                fetch.login.observe(on: MainScheduler.asyncInstance).subscribe  { [self]answer in
                    if  answer.element?.success == true {
                        self.performSegue(withIdentifier: "toHome", sender: nil)
                        
                    }else{
                        let message =  self.addAlert(title: "UYARI", message: "\(String(describing: answer.element!.message))")
                        self.present(message, animated: true, completion: nil)
                        self.mailTextfiled.text = ""
                        PswrdTextfiled.text = ""
                        
                    }
                    
                }.disposed(by: disposeBag)
            }
            
        }
        else {
            let a =  addAlert(title: "UYARI", message: "Alanları lütfen Doldurunuz")
            self.present(a, animated: true, completion: nil)
            mailTextfiled.text = ""
            PswrdTextfiled.text = ""
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
