//
//  ScholarshipRegistration.swift
//  SocialHelp
//
//  Created by yusuf bakır on 14.12.2023.
//

import UIKit
// pickDocument()
class ScholarshipRegistration: UIViewController {

    @IBOutlet var View1: UIView!
    @IBOutlet var aboutME: UITextView!
    @IBOutlet var View3: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
            setBackgroundImage(imageName: "back.jpeg")
        View1.layer.cornerRadius = 20
        aboutME.layer.cornerRadius = 20
        View3.layer.cornerRadius = 15
        
       
    }
    
   
    
    @IBAction func PdfSec(_ sender: Any) {
        pickDocument()
    }
    

}
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
        PdfTransactions.shared.pdfData(pdfURl: selectedFileURL)
        
           // Seçilen dosyayı kullanabilirsiniz
           print("Seçilen Dosya URL: \(selectedFileURL)")
           
          
           
       }

    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            // Kullanıcı seçim işlemini iptal ettiğinde çağrılır
            print("Belge seçimi iptal edildi")
        }
    

    
}
