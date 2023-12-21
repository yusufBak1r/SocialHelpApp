//
//  StudentDetailsVC.swift
//  SocialHelp
//
//  Created by yusuf bakır on 19.12.2023.
//

import UIKit

class StudentDetailsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundImage(imageName: "back.jpeg")
     
    }
    
    @IBAction func buttomBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
   
    
}
