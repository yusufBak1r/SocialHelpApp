//
//  ScholarshipRegistration.swift
//  SocialHelp
//
//  Created by yusuf bakır on 14.12.2023.
//

import UIKit

class ScholarshipRegistration: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            setBackgroundImage(imageName: "back.jpeg")
        
       
    }
    

   
    
    
   
    @IBAction func LoadingPdf(_ sender: Any) {
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
