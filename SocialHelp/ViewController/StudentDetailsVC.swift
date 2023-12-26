//
//  StudentDetailsVC.swift
//  SocialHelp
//
//  Created by yusuf bakır on 19.12.2023.
//

import UIKit

class StudentDetailsVC: UIViewController {
    var  selectedName =  ""
    var selectedUniversity = ""
    var selectedAboutMe = ""
    @IBOutlet var studentNameLabel: UILabel!
    @IBOutlet var aboutMeLabel: UILabel!
    @IBOutlet var universityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(imageName: "back.jpeg")
        
        studentNameLabel.text = selectedName
        aboutMeLabel.text = selectedAboutMe
        universityLabel.text = selectedUniversity
     
    }
    
    @IBAction func buttomBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
   
    @IBAction func ScholarshipButtom(_ sender: Any) {
        
      
        
        
    }
    @IBAction func TranskriptDownload(_ sender: Any) {
    }
    
}
