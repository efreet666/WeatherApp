//
//  TableHeader.swift
//  HomeWork 12.1
//
//  Created by Влад Бокин on 08.05.2021.
//

import UIKit

class TableHeader: UIView {

    @IBOutlet weak var windSpeedLabelOutlet: UILabel!
    @IBOutlet weak var tempLabelOutlet: UILabel!
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var cityLabelOutlet: UILabel!
    @IBOutlet weak var dateLabelOutlet: UILabel!
    @IBOutlet weak var feelsLikeLabelOutlet: UILabel!
    
    
    static func loadFromNIB() -> TableHeader {
        let nib = UINib(nibName: "TableHeader", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! TableHeader
    }
}
