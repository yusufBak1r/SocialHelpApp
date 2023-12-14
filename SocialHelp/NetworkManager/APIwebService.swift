//
//  APIwebService.swift
//  SocialHelp
//
//  Created by yusuf bakır on 29.11.2023.
//

import Foundation

protocol Webprotocol {
    func fetch(urlString: String, onSuccess: @escaping (Result<Data, Error>) -> Void)
}

class APIwebService:Webprotocol {
    
    func fetch(urlString: String, onSuccess: @escaping (Result<Data, Error>) -> Void) {
        guard let baseurlStrign = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with:baseurlStrign) { data,repponse,error  in
            if let error = error {
                   
               onSuccess(.failure(error))
           } else if let data = data {
                   onSuccess(.success(data))
//               let dataResponse = try! JSONDecoder().decode(Result<Data,Error>, from: data)
               
                        }
            
        }.resume()
        
    }
    
    
    
    
    
}
