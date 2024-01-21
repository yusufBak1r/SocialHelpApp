//
//  SettingVC.swift
//  SocialHelp
//
//  Created by yusuf bakır on 9.11.2023.
//

import UIKit
import RxSwift
import RxCocoa

class GiveScholarship: UIViewController {
 
    let disposedBag = DisposeBag()
    
    let fetch = StudentViewModel()
    @IBOutlet var dateScholarshipe: UIDatePicker!
    @IBOutlet var statment: UITextView!
    @IBOutlet var amount: UITextField!
    @IBOutlet var scholarshipName: UITextField!
    var studentId = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(imageName: "back.jpeg")
        statment.layer.cornerRadius = 20

      print(studentId)
    }
    

    @IBAction func Back(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func completed(_ sender: Any) {
        
        if statment.text != "" && amount.text != "" && scholarshipName.text != "" {
            
            if let convertIntAmount = Int(amount.text!) {
//                binding ()
//                fetch.scholarshipGive(amount: convertIntAmount, statement:statment.text , date:"2001-07-07", personID: 1, stutentID: studentId, sholarShipeName:scholarshipName.text! )
//                     
            }
            
        }else{
            let message =  self.addAlert(title: "UYARI", message: "Lütfen Gerekli Alanları Doldurunuz!")
            self.present(message, animated: true, completion: nil)
        }
    }
    
//    func binding () {
//        fetch.scholarShipe.observe(on: MainScheduler.asyncInstance).subscribe({ data in
//            
//            if data.element?.success == true {
//                let message =  self.addAlert(title: "UYARI", message: "Burs verme işlemi Başarılı")
//                self.present(message, animated: true, completion: nil)
//                self.scholarshipName.text = ""
//                self.amount.text = ""
//                self.statment.text = ""
//                
//            }else{
//                let message =  self.addAlert(title: "UYARI", message: data.element?.message ?? "Hata")
//                self.present(message, animated: true, completion: nil)
//            }
//            
//            
//            
//            
//        }).disposed(by: disposedBag)
//        
//    }
   
}
