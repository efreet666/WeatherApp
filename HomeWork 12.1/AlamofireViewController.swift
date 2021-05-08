//
//  AlamofireViewController.swift
//  HomeWork 12.1
//
//  Created by Влад Бокин on 08.05.2021.
//

import UIKit
import Alamofire

class AlamofireViewController: UIViewController {

    @IBOutlet weak var tableOutlet: UITableView!
    
    var tableHeader = TableHeader.loadFromNIB()
    
    var hourlyW: [Current] = []
    var dailyW: [Daily] = []
    var currentW: Current!
    
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableOutlet.dataSource = self
        self.tableOutlet.delegate = self
        self.tableOutlet.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherTableViewCell")

        networkManager.alamRequest { [weak self] (result) in
            switch result{
            case .success(response: let json):
                guard
                    let hourly = json.hourly,
                    let daily = json.daily,
                    let current = json.current
                else {return}
                self?.currentW = current
                self?.hourlyW = hourly
                self?.dailyW = daily
                
                DispatchQueue.main.async {
                    self?.tableOutlet.reloadData()
                }
            case .failure(error: let err):
            print(err)
            }
        }
    }
}

extension AlamofireViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyW.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOutlet.dequeueReusableCell(withIdentifier: "WeatherTableViewCell") as! WeatherTableViewCell
        cell.configure(with: dailyW[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            let cell = tableView.cellForRow(at: indexPath) as! WeatherTableViewCell
            let day = self.dailyW[indexPath.row]
            self.tableHeader.dateOutlet.text = "\((Date(timeIntervalSince1970: Double(day.dt!))))"
            self.tableHeader.cityOutlet.text = "Moscow" //Only Moscow
            self.tableHeader.mainWeatherOutlet.text = "\(String(describing: day.weather))"
            self.tableHeader.windSpeedOutlet.text = "Wind speed: \(Int(day.windSpeed!)) m/s"
            //self.tableHeader.ImageWeatherOutlet.image = cell.iconImageView1.image
            self.tableOutlet.tableHeaderView = self.tableHeader
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath == IndexPath(row: 0, section: 0) {
            DispatchQueue.main.async {
                self.tableHeader.dateOutlet.text = "\((Date(timeIntervalSince1970: Double(self.dailyW[0].dt!))))"
                self.tableHeader.tempOutlet.text = "Max: \(Int(self.dailyW[0].temp!.max!)-271)°C"
                self.tableHeader.windSpeedOutlet.text = "Wind speed: \(Int(self.dailyW[0].windSpeed!)) m/s"
                self.tableHeader.ImageWeatherOutlet.image = (cell as! WeatherTableViewCell).iconImageView1.image
                self.tableOutlet.tableHeaderView = self.tableHeader
            }
        }
    }
    
    
    
}
