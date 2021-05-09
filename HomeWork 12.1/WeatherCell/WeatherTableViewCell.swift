//
//  WeatherTableViewCell.swift
//  HomeWork 12.1
//
//  Created by Влад Бокин on 12.03.2021.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var highTempLabel: UILabel!
    @IBOutlet var lowTempLabel: UILabel!
    @IBOutlet weak var iconImageView1: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    static let identifier = "WeatherTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "WeatherTableViewCell", bundle: nil)
    }
    func configure(with model: Daily){
        self.highTempLabel.textAlignment = .center
        self.lowTempLabel.textAlignment = .center
        
        self.lowTempLabel.text = "\(Int((model.temp?.min)!)-271)°"
        self.highTempLabel.text = "\(Int((model.temp?.max)!)-271)°"
        self.dayLabel.text = getDate(Date(timeIntervalSince1970: Double(model.dt!)))
        self.dateLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(model.dt!)))
        
        if self.dayLabel.text == "Saturday" || self.dayLabel.text == "Sunday"{
            self.dayLabel.textColor = .red
        } else {
            self.dayLabel.textColor = .black
        }
        self.iconImageView1.image = UIImage(named: "\(model.weather!.first!.main!)")
    }
    
}

func getDayForDate(_ date: Date?) -> String{
    guard let inputDate = date else{
        return""
    }
    
    let formatter = DateFormatter()
    formatter.dateFormat = "d MMMM"
    return formatter.string(from: inputDate)
}

func getDate(_ date: Date?) -> String{
    guard let inputDate = date else{
        return""
    }
    
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE"
    return formatter.string(from: inputDate)
}
