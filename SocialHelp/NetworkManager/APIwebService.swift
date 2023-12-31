//
//  APIwebService.swift
//  SocialHelp
//
//  Created by yusuf bakır on 29.11.2023.
//

import Foundation
import Alamofire

protocol NetworkingAPI {
    
    func makeBodyRequest<T: Codable>(url: String, method: String,responseType: T.Type, parameters: [String: Any], completion: @escaping (Result<T, Error>) -> Void)
    func makeGetRequest<T: Codable>(url: String, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}
class APIwebService:NetworkingAPI {
    
    func makeBodyRequest<T: Codable>(url: String, method: String,responseType: T.Type, parameters: [String: Any], completion: @escaping (Result<T,Error>) -> Void) {
        
        guard let urlString = URL(string: url) else {return}
        
        AF.request(urlString,method: HTTPMethod(rawValue: method),parameters: parameters,encoding: JSONEncoding.default).responseJSON{ response in
            debugPrint(response)
            switch response.result {
            
            case .success(let data):
        
                do {
                    if let jsonData = try? JSONSerialization.data(withJSONObject: data){
 
                    let decoder = JSONDecoder()
                    let responseObject = try? decoder.decode(T.self, from: jsonData )
                        print(responseObject ?? "")
                        if let cevap = responseObject {
                            completion(.success(cevap))
                        }else{
                            throw NSError(domain: "Invalid JSON Data", code: 0, userInfo: nil)
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
              
            case .failure(let error):
                
                completion(.failure(error))
                completion(.failure(Constants.APIError.serverError(statusCode: 0)))
                
            }
            
            
        }
    }
    
    func makeGetRequest<T: Codable>(url: String, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let urlString = URL(string: url) else {completion(.failure(Constants.APIError.networkError))
            return}
        
        
        AF.request(urlString, method:HTTPMethod(rawValue: "GET")).responseJSON{ response in
            debugPrint(response)
            switch response.result {
            
            case .success(let data):
                do {
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: data)
                    
                    let decoder = JSONDecoder()
                    let responseObject = try? decoder.decode(T.self, from: jsonData)
                    if let cevap = responseObject {
                        completion(.success(cevap))
                    }
                    
                    
                } catch {
                    
                    completion(.failure(error))
                  print("Decoder json")
                }
            case .failure(let error):
                
                completion(.failure(error))
                completion(.failure(Constants.APIError.serverError(statusCode: 0)))
                
            }
        }
    }




    
    
    
    
    
    
    
    
    
    
    
    
    }

  
//class func taskForPOSTRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, body: String, completion: @escaping (ResponseType?, Error?) -> Void) {
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = body.data(using: .utf8)
//        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                DispatchQueue.main.async {
//                    completion(nil, error)
//                }
//                return
//            }
//            let decoder = JSONDecoder()
//            do {
//                let responseObject = try decoder.decode(ResponseType.self, from: data)
//                DispatchQueue.main.async {
//                    completion(responseObject, nil)
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    completion(nil, error)
//                }
//            }
//        }
//        task.resume()
//    }
