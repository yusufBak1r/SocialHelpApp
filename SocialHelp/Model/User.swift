//
//  User.swift
//  SocialHelp
//
//  Created by yusuf bakır on 8.11.2023.
//

import Foundation
protocol  UserProtocol {
    var user : User { get set }
//    Factory Deseni
//    Nesne oluşturmayı merkezi bir noktaya taşır ve farklı alt sınıfların oluşturulmasını soyutlar.
}
struct User :Codable{
    var email: String
    var phone :String
    var password: String
    init(email: String, password: String,phohe:String) {
        self.email = email
        self.password = password
        self.phone = phohe
    }
   
    

}
