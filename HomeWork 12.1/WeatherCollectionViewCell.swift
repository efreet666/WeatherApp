//
//  WeatherCollectionViewCell.swift
//  HomeWork 12.1
//
//  Created by Влад Бокин on 10.05.2021.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

    
    static let identifier = "WeatherCollectionViewCell"
     
    static func nib() -> UINib{
        return UINib(nibName: "WeatherCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var tempLabel: UILabel!
     
    func configure(with model: Current ){
        self.tempLabel.text = "\(String(describing: model.temp))"
        self.iconImageView.contentMode = .scaleAspectFit
        self.iconImageView.image = UIImage(named: "rain")
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
