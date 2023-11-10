//
//  ViewController.swift
//  SocialHelp
//
//  Created by yusuf bakır on 6.11.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var PswrdTextfiled: UITextField!
    @IBOutlet weak var mailTextfiled: UITextField!
   
  
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
   
    @IBAction func loginButtom(_ sender: Any) {
        
        
     
        
    }

    @IBAction func segmentedAction(_ sender: Any) {
                switch segmentedControl.selectedSegmentIndex {
                case 0 :
                    print("1. segmented tıklanıldı")
                case 1 :
                   performSegue(withIdentifier: "toSignin", sender: nil)
                case 2:
                    performSegue(withIdentifier: "toStudentSign", sender: nil)
                   
                default:
                    break
                }
            
    }
}
   


