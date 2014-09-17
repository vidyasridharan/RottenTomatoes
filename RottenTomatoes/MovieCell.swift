//
//  MovieCell.swift
//  RottenTomatoes
//
//  Created by Vidya Sridharan on 9/12/14.
//  Copyright (c) 2014 Vidya Sridharan. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.posterView.alpha=1
    }
    
    func setThumbnail (posterUrl: String) -> Void{
        self.posterView.setImageWithURL(NSURL(string: posterUrl))
        UIView.transitionWithView(posterView, duration: 0.9, options:UIViewAnimationOptions.CurveEaseOut , animations:{self.posterView.alpha = 1}, completion: nil)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
