//
//  NetworkManager.swift
//  HomeWork 12.1
//
//  Created by Влад Бокин on 02.05.2021.
//

import Foundation

enum ObtainResult {
    case success(response: weatherResponse)
    case failure(error: Error)
}
class NetworkManager {
    
    func obtainPosts() {
//            let session = URLSession(configuration: sessionConfiguration)
        
        guard let url = URL(string: "\(URLConst)") else {
            return
        }
        
        session.dataTask(with: url) { [weak self] (data, response, error) in
            guard let strongSelf = self else { return }
            if error == nil, let parsData = data{
                
                guard let posts = try? strongSelf.decoder.decode(weatherResponse.self, from: parsData) //maybe it's list of objects? -> []{
                else {
                    return
                }
                
                
            }else{
                print("Error: \(error?.localizedDescription)")
            }
        }
        .resume()
    }
}
