//
//  User.swift
//  SocialHelp
//
//  Created by yusuf bakır on 8.11.2023.
//

import Foundation
protocol Networking {
    func sendRequest(url: String, method: String, parameters: [String: Any], completion: @escaping (Result<Data, Error>) -> Void)
}
protocol  UserProtocol {
    var user : User { get set }
}
struct User :Codable,Networking{
    func sendRequest(url: String, method: String, parameters: [String : Any], completion: @escaping (Result<Data, Error>) -> Void) {
        
    }
    
    var email: String
    var phone :String
    var password: String
    init(email: String, password: String,phohe:String) {
        self.email = email
        self.password = password
        self.phone = phohe
    }
    
    

}
