//
//  ViewController.swift
//  HomeWork 12.1
//
//  Created by Влад Бокин on 12.03.2021.
//

import UIKit
import Foundation

 var models = [Daily]()

var current1: Current?
var currentWeather: [Current]?

public class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

   @IBOutlet var table: UITableView!
    
  
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(WeatherTableViewCell.nib(), forCellReuseIdentifier: WeatherTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
//        let url = "\(URLConst)"
//        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
//            
//            //validation
//            guard let data = data, error == nil else{
//                print("something went wrong")
//                return
//            }
//           
//            //convert data to models
//            
//            var json: weatherResponse?
//            do{
//                json = try JSONDecoder().decode(weatherResponse.self, from: data)
//            }
//            catch{
//                print("error: \(error)")
//            }
//            guard let result = json else{
//            return
//            }
//            
//            let entries = result.daily
//            
//            self.models.append(contentsOf: entries!)
//            
//            let current = result.current
//            self.current = current
//        
//            
//            //update user inteface
//            DispatchQueue.main.async {
//                self.table.reloadData()
//                self.table.tableHeaderView = self.createTableHeader()
//            }
//        }) .resume()
//        
//    }
        
    }
    public func createTableHeader() -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width ))
        headerView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        let locationLabel = UILabel(frame: CGRect(x: 5, y: 0 , width: view.frame.size.width -  20, height: headerView.frame.size.width/5 ))
        let weatherLabel = UILabel(frame: CGRect(x: 10, y: 40 + locationLabel.frame.size.height, width: view.frame.size.width -  20, height: headerView.frame.size.width/5 ))
        let tempLabel = UILabel(frame: CGRect(x: 10, y: 20 + locationLabel.frame.size.height + weatherLabel.frame.size.height  , width: view.frame.size.width -  20, height: headerView.frame.size.width/2 ))
        
        headerView.addSubview(locationLabel)
        headerView.addSubview(weatherLabel)
        headerView.addSubview(tempLabel)
        
        locationLabel.textAlignment = .center
        locationLabel.font = UIFont(name: "Helvetica-Bold", size: 32)
        tempLabel.textAlignment = .center
        tempLabel.font = UIFont(name: "Helvetica-Bold", size: 35)
        weatherLabel.textAlignment = .center
        weatherLabel.font = UIFont(name: "Helvetica", size: 25)
        tempLabel.text = "\((Int((current1?.temp)!)) - 271)°"
        
        locationLabel.text = "Moscow"
        weatherLabel.text = "Сloudly" //не разобрался как правильно вывести текущее состояние погоды
        return headerView
    }
    
    
    //table
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
