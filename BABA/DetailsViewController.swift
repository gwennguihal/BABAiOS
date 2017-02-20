//
//  DetailsViewController.swift
//  BABA
//
//  Created by Notel Pierre on 20/02/2017.
//  Copyright © 2017 Guihal Gwenn. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bonWeekEndHeightConstraint: NSLayoutConstraint!
    
    var weatherDay: WeatherDay?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.edgesForExtendedLayout = []
        
        temperatureLabel.text = "\(weatherDay!.temperature)°"
        dateLabel.text = WeatherCellAdapter.dateFormatter.string(from: weatherDay!.date)
        
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let isWeekEnd = calendar.isDateInWeekend(weatherDay!.date)
        bonWeekEndHeightConstraint.constant = isWeekEnd ? 100 : 0;
    }

}
