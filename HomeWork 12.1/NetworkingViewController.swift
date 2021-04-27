//
//  NetworkingViewController.swift
//  HomeWork 12.1
//
//  Created by Влад Бокин on 27.04.2021.
//

import UIKit

public class NetworkingViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()

        var table2: UITableView
        func getOutlet(outlet: UITableView){
            table2 = outlet
        }
        
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
                table2.reloadData()
                table2.tableHeaderView = createTableHeader()
            }
        }) .resume()
        
    }
    



}
