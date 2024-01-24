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
    let fetch = StudentViewModel()
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
        fetch.getTranscript(transcriptID: selectedIDStudentDetailsVC)
        

        func binding() {
            fetch.trancsriptGet.observe(on: MainScheduler.asyncInstance).subscribe({ data in
                if data.element?.success == true{
                    self.tratranscriptDcoder = self.transcriptBase64Decoder.decodeBase64ToPDF(base64String:  data.element?.data.transcriptPDF ?? "")
                    self.aboutMeLabel.text =   data.element?.data.term ?? ""
                    self.selectedName = data.element?.data.student?.name ?? ""
                }else{
                    print("hata")
                }
            }).disposed(by: disposeBag)
        }
      
        
        
    }
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
            return self
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
