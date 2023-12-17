//
//  PdfTransactions.swift
//  SocialHelp
//
//  Created by yusuf bakır on 15.12.2023.
//

import Foundation
import UIKit
import PDFKit
import Alamofire
class PdfTransactions:UIViewController,UIDocumentPickerDelegate {
    static let shared = PdfTransactions()
   
  
    func  pdfData (pdfURl:URL) {
        do
        {
            let fileData = try Data(contentsOf: pdfURl)
           
            let base64String = fileData.base64EncodedString()
            
            print(base64String)
            
            decodeBase64ToPDF(base64String: base64String)
            
            
            let user :User = User(email: "yusuf@amgml", password: "eaieaie", phohe: "11111111111")
            let model :Student = Student(user: user, name: "yusf", surname: "bakır", birthOfDateYear: 2001, identityNumber: "0", hasTranskript: false, schorlarship: false)
            let model1 :TranskriptModel = TranskriptModel(student: model, term: "yaşasın yardım ", trancriptPdf: base64String)
            fetch(trast: model1)
        }catch{
            print("Dosya okununrken hata oluştu \(error)")
        }
    }
    
    
    
    
    
    func decodeBase64ToPDF(base64String: String) {
            if let data = Data(base64Encoded: base64String) {
                // Data objesini PDF olarak açmak için bir URL oluştur
                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let pdfURL = documentsURL.appendingPathComponent("decodedPDF.pdf")
                
                do {
                    // Data'yı PDF dosyasına yaz
                    try data.write(to: pdfURL)
                    print("Base64'den PDF'ye dönüştürüldü: \(pdfURL)")
                    
                    // PDF dosyasını kullanabilirsiniz (örneğin, görüntüleyebilirsiniz)
                    // Örneğin: UIWebView, UIDocumentInteractionController, QuickLook gibi araçlarla
                } catch {
                    print("Dosyaya yazarken hata oluştu: \(error)")
                }
            }
        }
    func fetch (trast:TranskriptModel) {
        let parameters: [String: Any] = [
            "student": trast.student,
            "trem": trast.term,
            "transcriptPdf": trast.trancriptPdf
        ]
        AF.request("url", method: .post, parameters: parameters).response { response in
            if let data = response.data{
                do {
                    let cevap = try JSONDecoder().decode(Answer.self, from: data)
                    print("Transcript kayıt işlemi başarılı ",cevap.message!,cevap.succsess!)
                    print("işlem başarılı")
                    
                } catch{
                    print(error.localizedDescription)
                }
            }
        }
        
        
    }
    
    
}
