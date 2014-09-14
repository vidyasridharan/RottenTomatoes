//
//  PosterViewController.swift
//  RottenTomatoes
//
//  Created by Vidya Sridharan on 9/13/14.
//  Copyright (c) 2014 Vidya Sridharan. All rights reserved.
//

import UIKit

class PosterViewController: UIViewController {

    
    @IBOutlet weak var synopsisLabel: UILabel!

    @IBOutlet var posterBigImage: UIImageView!

    
    @IBOutlet var scrollView: UIScrollView!
    
    
    @IBOutlet weak var contentView: UIView!
    var posterUrl = ""
    
    
    var descriptionText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        posterBigImage.setImageWithURL(NSURL(string: posterUrl ))
        synopsisLabel.text = descriptionText
        synopsisLabel.sizeToFit()
     
        scrollView.contentSize.height   = 320 + contentView.frame.size.height
        scrollView.contentSize.width = 320
        contentView.addSubview(synopsisLabel)
        scrollView.addSubview(contentView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
