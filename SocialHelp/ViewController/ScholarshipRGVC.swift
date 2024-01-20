//
//  ScholarshipRegistration.swift
//  SocialHelp
//
//  Created by yusuf bakır on 14.12.2023.
//

import UIKit
// pickDocument()
import RxSwift
import RxCocoa
class ScholarshipRegistration: UIViewController {
    let disposeBag = DisposeBag()
    let fetch = StudentViewModel()
    
    var studntModel :StudentAnswerSignin?
    var transcriptString:String = ""
    @IBOutlet var studentEmail: UITextField!
      
    @IBOutlet var studentPassword: UITextField!
    @IBOutlet var DateOfBirth: UITextField!
    @IBOutlet var studentLastName: UITextField!
    @IBOutlet var studentName: UITextField!
    @IBOutlet var View1: UIView!
    @IBOutlet var aboutME: UITextView!
    @IBOutlet var View3: UIView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
 
        setBackgroundImage(imageName: "back.jpeg")
        View1.layer.cornerRadius = 20
        aboutME.layer.cornerRadius = 20
        View3.layer.cornerRadius = 15
        studentPassword.isSecureTextEntry = true

       
       
    }
    
    @IBAction func StudentSignup(_ sender: Any) {
        
        if studentPassword.text != "",DateOfBirth.text != "",studentName.text  != "" ,studentName.text != "" ,studentLastName.text != ""   {
         
            
            
            let studentSignUp = Student(name: studentName.text!, surname: studentLastName.text!, birthOfDateYear: Int(DateOfBirth.text!) ?? 00000, identityNumber: "", hasTranskript: false, schorlarship: false, email: studentEmail.text!,  phone: studentPassword.text!, password: "00000000000")
            

            binding()
            fetch.studentSignin(student: studentSignUp)
           
            
            
            
        }else{
            let messageSignAllert = self.addAlert(title: "UYARI", message: "Gerekli alanları doldurunuz")
            self.present(messageSignAllert, animated: true, completion: nil)
        }
       

    }
    
    func binding() {
        
        
//        fetch.studentSignUp.observe(on: MainScheduler.asyncInstance).subscribe{ answer in
//            
//            if answer.success == true {
//                self.studntModel = answer
//               
//                let messageSignAllert = self.addAlert(title: "UYARI", message:answer.message )
//                self.present(messageSignAllert, animated: true, completion: nil)
//                self.studentPassword.text = ""
//                self.DateOfBirth.text = ""
//                self.studentLastName.text = ""
//                self.studentName.text = ""
//                self.studentEmail.text = ""
//                
//            
//                  
//            }else if answer.success == false  {
//               
//                let messageAllert = self.addAlert(title: "UYARI", message: answer.message )
//                self.present(messageAllert, animated: true, completion: nil)
//            }
//            
//        }.disposed(by: disposeBag)
        
        
        
    }
    @IBAction func PdfSec(_ sender: Any) {
        
        
//        pdf seçimi için fonsksiyonu
        pickDocument()
    }
    
    @IBAction func scholarshipComplete(_ sender: Any) {
        if  aboutME.text != "" {
           
//            fetch.transcriptLoading(base64: transcriptString, studentID: studntModel?.data.id ?? 0 , term: aboutME.text)
            
            
            
        }else {
            let messageAllert = self.addAlert(title: "UYARI", message:"Lütfen kendininzden biraz Bahsedin" )
            self.present(messageAllert, animated: true, completion: nil)
        }
        
        
    }
    

}
// kulanıcını pdf dosyasını seçmesi için oluşturduğum delagete ile fonksiyonları burda çalışıyor
extension ScholarshipRegistration :UIDocumentPickerDelegate{
    
    func pickDocument() {
          let documentPicker = UIDocumentPickerViewController(documentTypes: ["com.adobe.pdf"], in: .import)
          documentPicker.delegate = self
          documentPicker.allowsMultipleSelection = false // Tek bir dosya seçimi
          present(documentPicker, animated: true, completion: nil)
        
      }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
           // Kullanıcı bir dosya seçtiğinde çağrılır
           guard let selectedFileURL = urls.first else {
               return
             
           }
         transcriptString =  PdfTransactions.shared.pdfData(pdfURl: selectedFileURL)
        
           // Seçilen dosyayı kullanabilirsiniz
           print("Seçilen Dosya URL: \(selectedFileURL)")
        let messageAllert = self.addAlert(title: "UYARI", message: "Transkript Başarıyla Yüklendi")
        self.present(messageAllert, animated: true, completion: nil)
       
           
          
           
       }

    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            // Kullanıcı seçim işlemini iptal ettiğinde çağrılır
            print("Belge seçimi iptal edildi")
        let messageAllert = self.addAlert(title: "UYARI", message: "Transkript  Yükleme Başarısız")
        self.present(messageAllert, animated: true, completion: nil)
        }
    

    
}
