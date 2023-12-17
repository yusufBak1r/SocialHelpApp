//
//  APIwebService.swift
//  SocialHelp
//
//  Created by yusuf bakır on 29.11.2023.
//

import Foundation
import Alamofire
protocol NetworkingAPI {
    func sendRequest<T: Decodable>(url: String, method: String, parameters: [String: Any], responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}
class APIwebService:NetworkingAPI {
    func sendRequest<T: Decodable>(url: String, method: String, parameters: [String: Any], responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let urlString = URL(string: url) else {return}
        
        
        AF.request(urlString, method: HTTPMethod(rawValue: method), parameters: parameters).response { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data!)
                    let decoder = JSONDecoder()
                    let responseObject = try decoder.decode(T.self, from: jsonData)
                    completion(.success(responseObject))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
