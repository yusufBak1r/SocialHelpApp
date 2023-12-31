//
//  StudentDetailsVC.swift
//  SocialHelp
//
//  Created by yusuf bakır on 19.12.2023.
//

import UIKit
import SafariServices
import RxSwift
import RxCocoa
class StudentDetailsVC: UIViewController, UIDocumentPickerDelegate {
    let fetch = StudentDao()
    let transcriptBase64Decoder = PdfTransactions()
    var  selectedName =  ""
    var selectedUniversity = ""
    var selectedAboutMe = ""
    var selectedIDStudentDetailsVC:Int = 0
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
        print(selectedIDStudentDetailsVC)
        fetch.transcriptDownload(id: selectedIDStudentDetailsVC)
        transcriptBase64Decoder.decodeBase64ToPDF(base64String: "")
        
        if let pdfURL = URL(string: "https://example.com/path/to/your/pdf.pdf") {
                    let safariViewController = SFSafariViewController(url: pdfURL)
                    present(safariViewController, animated: true, completion: nil)
                }
            
        
        
    }
}
