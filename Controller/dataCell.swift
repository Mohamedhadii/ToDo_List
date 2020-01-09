//
//  dataCell.swift
//  tableViewStudy
//
//  Created by Hady on 11/4/19.
//  Copyright © 2019 gadou. All rights reserved.
//

import UIKit

class dataCell: UITableViewCell {

   
   
    @IBOutlet weak var mediaImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func setMedia(App : Media)   {
        mediaImage.image = App.image
        titleLabel.text = App.title
    }
    
}
