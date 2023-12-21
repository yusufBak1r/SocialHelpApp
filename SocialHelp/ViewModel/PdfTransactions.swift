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
    
    
    
    func  pdfData (pdfURl:URL) {
        do
        {
            let fileData = try Data(contentsOf: pdfURl)
           
            let base64String = fileData.base64EncodedString()
            
            print(base64String)
            
            decodeBase64ToPDF(base64String: base64String)

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
   
    
}
