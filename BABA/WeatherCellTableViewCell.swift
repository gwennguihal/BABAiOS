//
//  WeatherCellTableViewCell.swift
//  BABA
//
//  Created by Guihal Gwenn on 17/02/17.
//  Copyright © 2017 Guihal Gwenn. All rights reserved.
//

import AlamofireImage
import UIKit

class WeatherCellTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.af_cancelImageRequest()
        iconImageView.image = nil
    }
    
    func update(_ adapter:WeatherCellAdapter) {
        temperatureLabel.text = adapter.temperature
        dateLabel.text = adapter.date
        if let iconURL = adapter.iconURL {
            iconImageView.af_setImage(withURL: iconURL)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
