//
//  HeroTableViewCell.swift
//  Heros
//
//  Created by Marcelo Block Teixeira on 18/06/20.
//  Copyright © 2020 Marcelo Block Teixeira. All rights reserved.
//

import UIKit
import Kingfisher

class HeroTableViewCell: UITableViewCell {

    @IBOutlet weak var titleHeros: UILabel!
    @IBOutlet weak var imageHeros: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepereCell(with heros: Result){
        titleHeros.text = heros.name
        if let url = URL(string: heros.thumbnail.url) {
            imageHeros.kf.indicatorType = .activity
            imageHeros.kf.setImage(with: url)
        } else {
            imageHeros.image = nil
        }
        
        imageHeros.layer.cornerRadius = imageHeros.frame.size.height/2
        imageHeros.layer.borderColor = UIColor.red.cgColor
        imageHeros.layer.borderWidth = 2
    }

}
