//
//  TableHeader.swift
//  HomeWork 12.1
//
//  Created by Влад Бокин on 08.05.2021.
//

import UIKit

class TableHeader: UIView {

    @IBOutlet weak var dateOutlet: UILabel!
    @IBOutlet weak var tempOutlet: UILabel!
    @IBOutlet weak var windSpeedOutlet: UILabel!
    @IBOutlet weak var ImageWeatherOutlet: UIImageView!
    @IBOutlet weak var feelsLikeOutlet: UILabel!
    @IBOutlet weak var mainWeatherOutlet: UILabel!
    @IBOutlet weak var cityOutlet: UILabel!
    
    static func loadFromNIB() -> TableHeader {
        let nib = UINib(nibName: "TableHeader", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! TableHeader
    }
}
