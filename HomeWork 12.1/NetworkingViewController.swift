//
//  NetworkingViewController.swift
//  HomeWork 12.1
//
//  Created by Влад Бокин on 27.04.2021.
//

import UIKit
import Foundation

public class NetworkingViewController {
        
        let url = "\(URLConst)"
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            //validation
            guard let data = data, error == nil else{
                print("something went wrong")
                return
            }
           
            //convert data to models
            
            var json: weatherResponse?
            do{
                json = try JSONDecoder().decode(weatherResponse.self, from: data)
            }
            catch{
                print("error: \(error)")
            }
            guard let result = json else{
            return
            }
            
            let entries = result.daily
            
            models.append(contentsOf: entries!)
            
            var current = result.current
            current = current1
        
            
            //update user inteface
            DispatchQueue.main.async {
                table.reloadData()
                table.tableHeaderView = createTableHeader()
            }
        }) .resume()
        
    }
    



}
