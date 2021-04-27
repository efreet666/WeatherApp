//
//  WeatherCollectionViewCell.swift
//  HomeWork 12.1
//
//  Created by Влад Бокин on 13.03.2021.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

    
    static let identifier = "WeatherCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "WeatherCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    
    func configure(with model: Current?){
        self.tempLabel.text = "(model?.temp)"
        self.iconImageView.image = UIImage(named: "Snow")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

}
