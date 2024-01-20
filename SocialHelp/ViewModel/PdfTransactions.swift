//
//  PdfTransactions.swift
//  SocialHelp
//
//  Created by yusuf bakır on 15.12.2023.
//

import Foundation
import UIKit
import PDFKit
class PdfTransactions:UIViewController,UIDocumentPickerDelegate {
    static let shared = PdfTransactions()
    
    let fetch = StudentManager()
    
    func  pdfData (pdfURl:URL) ->String{
        do
        {

            let fileData = try Data(contentsOf: pdfURl)
           
            let base64String = fileData.base64EncodedString()
//            pdf dosyasını base64 çevirerek metin tabanlı veri tabanlarına kaydetme.
            

            return base64String
            decodeBase64ToPDF(base64String: base64String)

        }catch{
            print("Dosya okununrken hata oluştu \(error)")
            return ""
        }
       
    }
    
    
    
//    veri tabanında gelen base64 formatındaki veriyi decoder ederek pdf dönüştürür
    func decodeBase64ToPDF(base64String: String) -> String{
            if let data = Data(base64Encoded: base64String) {
                // Data objesini PDF olarak açmak için bir URL oluştur
                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let pdfURL = documentsURL.appendingPathComponent("decodedPDF.pdf")
                
                do {
                    // Data'yı PDF dosyasına yaz
                    try data.write(to: pdfURL)
                    print("Base64'den PDF'ye dönüştürüldü: \(pdfURL)")
                    return pdfURL.absoluteString
                    
                    // PDF dosyasını kullanabilirsiniz (örneğin, görüntüleyebilirsiniz)
                    // Örneğin: UIWebView, UIDocumentInteractionController, QuickLook gibi araçlarla
                } catch {
                    print("Dosyaya yazarken hata oluştu: \(error)")
                    return ""
                }
            }
        return "" 
        }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if let pickedPDFURL = urls.first {
            do {
                let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                let destinationURL = documentsURL.appendingPathComponent(pickedPDFURL.lastPathComponent)
                
                try FileManager.default.copyItem(at: pickedPDFURL, to: destinationURL)
                
                // İndirme başarılı oldu
                print("PDF dosyası başarıyla indirildi. Yol: \(destinationURL.absoluteString)")
                
            
            } catch {
                // İndirme hatası
                print("PDF dosyası indirilemedi. Hata: \(error.localizedDescription)")
            }
        }
    }
   
    
}
// Örnek bir buton veya herhangi bir kullanıcı etkileşimi için bir fonksiyon
  
