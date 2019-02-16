//
//  BestFilmTableViewCell.swift
//  SampleWebAPI
//
//  Created by Arthur BLANC on 16/02/2019.
//  Copyright © 2019 Digipolitan. All rights reserved.
//

import UIKit

class BestFilmTableViewCell: UITableViewCell {

 
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var releasedDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
