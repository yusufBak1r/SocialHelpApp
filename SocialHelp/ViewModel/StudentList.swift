//
//  StudentList.swift
//  SocialHelp
//
//  Created by yusuf bakır on 17.12.2023.
//

import Foundation

import RxSwift
import RxCocoa
class StudentList {
    let networkign = APIwebService()
    
    let scholarship : PublishSubject <[Scholarship]> = PublishSubject()
    
    
    func student (user:User) {
        
        networkign.sendRequest(url:Constants.Url.BaseUrl.stringValue, method: "Get", parameters: [:], responseType:User.self, completion: { reslut in
            switch reslut {
            case .success(let user):
                   print("User: \(user)")
               case .failure(let error):
                   print("Error: \(error)")
            
            }
       
        })
        
    }
    
}

//    let parameters: [String: Any] = [
//        "student": trast.student,
//        "trem": trast.term,
//        "transcriptPdf": trast.trancriptPdf
//    ]
