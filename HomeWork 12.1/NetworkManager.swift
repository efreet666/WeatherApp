//
//  NetworkManager.swift
//  HomeWork 12.1
//
//  Created by Влад Бокин on 02.05.2021.
//

import Foundation

enum ObtainResult {
    case success(response: WeatherSomeDays)
    case failure(error: Error)
}
class NetworkManager {
    
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
}
