//
//  APIwebService.swift
//  SocialHelp
//
//  Created by yusuf bakır on 29.11.2023.
//

import Foundation
import Alamofire

protocol NetworkingAPI {
    
    func makeRequest<T: Codable>(url: String, method: String,responseType: T.Type, parameters: [String: Any]?, completion: @escaping (Result<T, Constants.ErrorTypes>) -> Void)
    
}
class APIwebService:NetworkingAPI {

    
    
    static let shared = APIwebService()
    func makeRequest<T: Codable>(url: String, method: String,responseType: T.Type, parameters: [String: Any]? , completion: @escaping (Result<T,Constants.ErrorTypes>) -> Void) {
        
        guard let urlString = URL(string: url) else {return}
        completion(.failure(.invalidURL))
        
        AF.request(urlString,method: HTTPMethod(rawValue: method),parameters: parameters,encoding: JSONEncoding.default).responseJSON{ response in
            debugPrint(response)
            switch response.result {
            
            case .success(let data):
        
                do {
                    if let jsonData = try? JSONSerialization.data(withJSONObject: data){
 
                    let decoder = JSONDecoder()
                    let responseObject = try? decoder.decode(T.self, from: jsonData )
                        print(responseObject ?? "")
                        if let answer = responseObject {
                            completion(.success(answer))
                            
                        }else{
                            completion(.failure(.invalidData))
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                   
                }
              
            case .failure(_):
            completion(.failure(.generalError))
                
                
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
