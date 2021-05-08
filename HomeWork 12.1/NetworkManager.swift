//
//  NetworkManager.swift
//  HomeWork 12.1
//
//  Created by Влад Бокин on 02.05.2021.
//

import Foundation
import Alamofire

enum ObtainResult {
    case success(response: WeatherSomeDays)
    case failure(error: Error)
}
class NetworkManager {
    
    //MARK: - URLSession
    
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    func obtainPosts(completion: @escaping (ObtainResult) -> Void) {
       
        guard let url = URL(string: "\(URLConst)") else {
            return
        }
        
        session.dataTask(with: url) { [weak self] (data, response, error) in
            
            var result: ObtainResult
            
            defer{
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            guard let strongSelf = self else {
                result = .failure(error: error!)
                return
            }
            if error == nil, let parsData = data{
                
                guard let posts = try? strongSelf.decoder.decode(WeatherSomeDays.self, from: parsData)
                else {
                    result = .failure(error: error!)
                    return
                }
                
                result = .success(response: posts)
            } else {
                result = .failure(error: error!)
            }
            completion(result)
        }
        .resume()
    }
    
    //MARK: - Alamofire
    
    enum ObtainWeatherResult {
        case success(response: WeatherSomeDays)
        case failure(error: Error)
    }
    
    func alamRequest(complition: @escaping (ObtainWeatherResult) -> Void){
        AF.request(URLConst).responseDecodable(of: WeatherSomeDays.self) { (responseJSON) in
            switch responseJSON.result{
            case .success(let JSON):
                complition(.success(response: JSON))
            case .failure(let error):
                complition(.failure(error: error))
            }
            
        }
    }
}
