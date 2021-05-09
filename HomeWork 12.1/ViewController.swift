//
//  ViewController.swift
//  HomeWork 12.1
//
//  Created by Влад Бокин on 12.03.2021.
//

import UIKit
import Foundation

 class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var hourlyW: [Current] = []
    var dailyW: [Daily] = []
    var currentW: Current!

   @IBOutlet var table: UITableView!
    
  let networkManager = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(WeatherTableViewCell.nib(), forCellReuseIdentifier: WeatherTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
        networkManager.obtainPosts { (result) in
            switch result{
            case .success(let response):
                guard
                    let hourly = response.hourly,
                    let daily = response.daily,
                    let current = response.current
                else {
                    return
                }
                self.currentW = current
                self.dailyW = daily
                self.hourlyW = hourly
                DispatchQueue.main.async {
                    self.table.reloadData()
                self.table.tableHeaderView = self.createTableHeader()
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
        }
            
        }
        
    }
    public func createTableHeader() -> UIView {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width ))
        headerView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        
        let locationLabel = UILabel(frame: CGRect(x: 5, y: -15 , width: view.frame.size.width -  20, height: headerView.frame.size.width/5 ))
        
        let weatherLabel = UILabel(frame: CGRect(x: 10, y: 40 + locationLabel.frame.size.height, width: view.frame.size.width -  20, height: headerView.frame.size.width/5 ))
        
        let tempLabel = UILabel(frame: CGRect(x: 10, y: 20 + weatherLabel.frame.size.height  , width: view.frame.size.width -  20, height: headerView.frame.size.width/2 ))
        
        let imageView = UIImageView(frame: CGRect(x: view.frame.size.width / 2 - 50, y: view.frame.size.width / 2 - 150, width: 100, height: 100))
        
        let windLabel = UILabel(frame: CGRect(x: 10, y: 20 + locationLabel.frame.size.height + weatherLabel.frame.size.height  , width: view.frame.size.width -  25, height: headerView.frame.size.width/2 ))
        
        let feelsLikeLabel = UILabel(frame: CGRect(x: 10, y: 45 + locationLabel.frame.size.height + weatherLabel.frame.size.height  , width: view.frame.size.width -  30, height: headerView.frame.size.width/2 ))
        
        headerView.addSubview(imageView)
        headerView.addSubview(locationLabel)
        headerView.addSubview(tempLabel)
        headerView.addSubview(windLabel)
        headerView.addSubview(feelsLikeLabel)
        
        locationLabel.textAlignment = .center
        locationLabel.font = UIFont(name: "Helvetica-Bold", size: 26)
        tempLabel.textAlignment = .center
        tempLabel.font = UIFont(name: "Helvetica-Bold", size: 35)
        weatherLabel.textAlignment = .center
        weatherLabel.font = UIFont(name: "Helvetica", size: 25)
        tempLabel.text = ("\(Int(currentW.temp!) - 271)°")
        feelsLikeLabel.text = "Feels like \(Int(currentW.feelsLike!) - 271)°"
        windLabel.text = "Wind speed \(currentW.windSpeed!) m/s"
        
        
        imageView.image = UIImage(named: "\(self.dailyW.first!.weather!)") // optional value
        
        locationLabel.text = "Moscow"
        weatherLabel.text = "\("clouds")"
        return headerView
    }
    
    
    
    //table
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyW.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
        cell.configure(with: dailyW[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
