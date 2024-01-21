//
//  SigninVC.swift
//  SocialHelp
//
//  Created by yusuf bakır on 8.11.2023.
//

import UIKit
import RxSwift
import RxCocoa
class SigninVC: UIViewController {
    
    
    @IBOutlet var personEmail: UITextField!
    
    
    
   var fetch = UserViewModel()
    let disposeBag = DisposeBag()
    
   
    

    
    @IBOutlet var personName: UITextField!
    
    @IBOutlet var personPhone: UITextField!
    @IBOutlet var personSurname: UITextField!
  
    
    @IBOutlet var personPassAgain: UITextField!
    @IBOutlet var personPassword: UITextField!
    @IBOutlet var personJob: UITextField!
    @IBOutlet var personBirthDate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(imageName: "back.jpeg")
        // Do any additional setup after loading the view.
        personPassword.isSecureTextEntry = true
        personPassAgain.isSecureTextEntry = true
        
       
       
    }
    func setupBindigs() {
        
        fetch.signUp.observe(on: MainScheduler.asyncInstance).subscribe(onNext: { cevap in
            if cevap.success {
                let cevapSucces =  self.addAlert(title: "UYARI", message: cevap.message)
                self.present(cevapSucces, animated: true, completion: nil)
                self.personName.text = ""
                self.personSurname.text = ""
                self.personEmail.text = ""
                self.personPassword.text  = ""
                self.personJob.text  = ""
                self.personBirthDate.text = ""
                self.personPhone.text = ""
                self.personPassAgain.text = ""
                
                
            } else{
                let cevapSuccesFalse =  self.addAlert(title: "UYARI", message: cevap.message)
                self.present(cevapSuccesFalse, animated: true, completion: nil)
               
            }
            
        }).disposed(by: disposeBag)

        
    }
    
    
    
    
    @IBAction func SigingButtom(_ sender: Any) {
        
        if personName.text != "" && personSurname.text != "" && personEmail.text != "" && personPassAgain.text  != "" && personJob.text  != "" && personBirthDate.text != "" && personPassword.text != "" && personPhone.text != "" {
            if personPassAgain.text  == personPassword.text  {
            
                let personSignUp = Person(name: personName.text!, surname: personSurname.text!, birthOfYear:Int(personBirthDate.text!) ?? 0, job:  personJob.text!, email: personEmail.text!, password: personPassword.text!, phone: personPhone.text!)
                
                
                
                let personSignin = Person(name:  personName.text!, surname: personSurname.text!, birthOfYear:Int( personBirthDate.text!) ?? 0, job: personJob.text!, email: personEmail.text!, password: personPassAgain.text!, phone: personPhone.text! )
               
        
                fetch.userSinginUp(signinPerson: personSignin)
                
                setupBindigs()
             
            }
            else {
                let b =  addAlert(title: "UYARI", message: "Şifreniz birbiriyle uyuşmuyor lütfen tekrar deneyiniz!")
                self.present(b, animated: true, completion: nil)
                personPassAgain.text = ""
                personPassword.text = ""
            }
                
                
            }else {
                let a =  addAlert(title: "UYARI", message: "İlgili Alanları doldurunuz")
                self.present(a, animated: true, completion: nil)
                
                
                
                
            }
        
       
      }
    func validatePhoneNumber(_ phoneNumber: String) -> Bool {
        let numericPhoneNumber = phoneNumber.trimmingCharacters(in: .whitespaces)
        
        // Sadece rakamlardan oluşuyor mu?
        if let _ = Int(numericPhoneNumber), numericPhoneNumber.count == 11 {
            return true
        } else {
            return false
        }
    }
    
    
    
    
    
    @IBAction func dismissLogin(_ sender: Any) {
        dismiss(animated: true)
     

        
        }
        
        
        
    @IBAction func add(_ sender: Any) {
        let jsonString = """
        {
            "success": false,
            "message": "Mailin 6 karakterden uzun olması lazım",
          
        }
        """
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                    let decoder = JSONDecoder()
                    let responseObject = try decoder.decode(PersonAnswer.self, from: jsonData)
                    print(responseObject)
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
        }
        
    }
   
      
        
    }
