//
//  StudentDetailsVC.swift
//  SocialHelp
//
//  Created by yusuf bakır on 19.12.2023.
//

import UIKit
import SafariServices
import RxSwift
import PDFKit
import RxCocoa
class StudentDetailsVC: UIViewController, UIDocumentPickerDelegate, UIDocumentInteractionControllerDelegate  {
    let fetch = StudentDao()
    let disposeBag = DisposeBag()
    let transcriptBase64Decoder = PdfTransactions()
    var  selectedName =  ""
    var selectedUniversity = "Fırat Üniversitesi Yazılım Mühendisliği"
   
    var tratranscriptDcoder:String = ""
    let urlTranscript = ""
    var selectedIDStudentDetailsVC:Int = 0
    @IBOutlet var studentNameLabel: UILabel!
    @IBOutlet var aboutMeLabel: UILabel!
    @IBOutlet var universityLabel: UILabel!
    var documentInteractionController: UIDocumentInteractionController!
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(imageName: "back.jpeg")
        
        studentNameLabel.text = selectedName
     
        universityLabel.text = selectedUniversity
        binding()
        fetch.transcriptDownload(id: 152)

   
      
        
        
    }
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
            return self
        }
    
    func binding() {
        fetch.trancsriptGett.observe(on: MainScheduler.asyncInstance).subscribe({ data in
            
            if data.element?.success == true {
                print("çalışıyor rx swift")
                self.tratranscriptDcoder = self.transcriptBase64Decoder.decodeBase64ToPDF(base64String:  data.element?.data.transcriptPDF ?? "")
                self.aboutMeLabel.text =   data.element?.data.term ?? ""

            }else{
                print("rx Swift çalışmadı")
            }
            
            
        }).disposed(by: disposeBag)
    }
    @IBAction func buttomBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func ScholarshipButtom(_ sender: Any) {
        performSegue(withIdentifier: "toScholarshipGive", sender: nil)
    }
    @IBAction func TranskriptDownload(_ sender: Any) {
        
        
        if let pdfURL = URL(string: tratranscriptDcoder) {
          
            self.documentInteractionController = UIDocumentInteractionController(url: pdfURL)
            self.documentInteractionController.delegate = self
            self.documentInteractionController.presentPreview(animated: true)
               }
      
        
            
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toScholarshipGive" {
            if  let navigationController = segue.destination as?  UINavigationController {
                if let GiveScholarshipVC = navigationController.topViewController as? GiveScholarship {
                    GiveScholarshipVC.studentId = selectedIDStudentDetailsVC
                    
                    
                    
                }
                
                
            }
           
             
        }
    }
    
}
