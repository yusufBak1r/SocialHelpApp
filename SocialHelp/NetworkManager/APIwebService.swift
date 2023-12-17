//
//  APIwebService.swift
//  SocialHelp
//
//  Created by yusuf bakır on 29.11.2023.
//

import Foundation
import Alamofire

class APIwebService {
    
    
    static let webservice = APIwebService()
//    func TranscriptFetch (transcript : TranskriptModel) {
//        let parameters : [String:Any] = [
//            "email":Model?.email ?? "",
//            "password":Model?.password ?? "",
//            "TCno" :Model?.TCno ?? ""
// 
//        ]
//        AF.request("url", method: .post, parameters: parameters).response { response in
//            if let data = response.data{
//                do {
//                    let cevap = try JSONDecoder().decode(Answer.self, from: data)
//                    print("login işlemi başarılı ",cevap.message!,cevap.succsess!)
//                    print("işlem başarılı")
//                    
//                } catch{
//                    print(error.localizedDescription)
//                }
//            }
//        }
//        
//        
//    }
//    
//    
//    
    
    
    
    
    
    
//    func StudentScholarshipRegister (Model:Student?) {
//        let parameters : [String:Any] = [
//            "email":Model. ?? "",
//            "password":Model?.password ?? "",
//            "TCno" :Model?.TCno ?? ""
// 
//        ]
//        AF.request("url", method: .post, parameters: parameters).response { response in
//            if let data = response.data{
//                do {
//                    let cevap = try JSONDecoder().decode(Answer.self, from: data)
//                    print("login işlemi başarılı ",cevap.message!,cevap.succsess!)
//                    print("işlem başarılı")
//                    
//                } catch{
//                    print(error.localizedDescription)
//                }
//            }
//        }
//        
//    }
    func loginUser(email: String, password: String){
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]

        AF.request("url", method: .post, parameters: parameters).response { response in
            if let data = response.data{
                do {
                    let cevap = try JSONDecoder().decode(Answer.self, from: data)
                    print("login işlemi başarılı ",cevap.message!,cevap.succsess!)
                    print("işlem başarılı")
                    
                } catch{
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    
    func UserRegister () {
        
        
    }
    func ScholarshipFecth() {
        
        
        
    }
    
    
}
//AF.request("https://jsonplaceholder.typicode.com/posts")
//        .responseDecodable(of: [Post].self) { response in
//            switch response.result {
//            case .success(let posts):                                 GET işlemi icçin kullanılır
//                print("Posts: \(posts)")
//                // Başarılı yanıt geldiğinde, postları kullanabilirsiniz.
//            case .failure(let error):
//                print("Error: \(error)")
//                // Hata durumunda uygun işlemleri gerçekleştirin.
//            }
//        }
