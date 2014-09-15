//
//  MoviesViewController.swift
//  RottenTomatoes
//
//  Created by Vidya Sridharan on 9/11/14.
//  Copyright (c) 2014 Vidya Sridharan. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var movies: [NSDictionary] = []
    
    @IBOutlet weak var searchTabBar: UISearchBar!
   
    
    @IBOutlet weak var announcementView: UIView!
    @IBOutlet weak var networkError: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.networkError.hidden = true
        self.searchTabBar.hidden = false
        var hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.labelText = "loading .."
        hud.show(true)
        
        var url = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=dagqdghwaq3e3mxyrp7kmmj5&limit=20&country=us"
        var request = NSURLRequest(URL: NSURL(string: url))
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response:NSURLResponse!, data: NSData!, error:NSError!) -> Void in
            
            if(error != nil){
                self.networkError.hidden = false
                self.searchTabBar.hidden  = true
            }
            else{
                self.networkError.hidden = true
                self.searchTabBar.hidden = false
                var object = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
                println("object: \(object)")
                self.movies = object["movies"] as [NSDictionary]
                self.tableView.reloadData()
            }
            MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
            
        }
        
          // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section:Int)->Int {
        return movies.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)->UITableViewCell{
        
        var cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as MovieCell
        var movie = movies[indexPath.row]
        cell.titleLabel.text = movie["title"] as? String
        cell.synopsisLabel.text = movie["synopsis"] as? String
        //What does it mean as UITableViewCell
        
        var posters = movie["posters"] as NSDictionary
        var posterUrl = posters["thumbnail"] as String
        
        cell.posterView.setImageWithURL(NSURL(string: posterUrl))
        
        
        println("Hello, I'm at row: \(indexPath.row), section: \(indexPath.section), and: \(cell.titleLabel.text)")
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let indexPath = tableView.indexPathForSelectedRow()
        var movie = movies[indexPath!.row]
        var posters = movie["posters"] as NSDictionary
         var textdesc = movie["synopsis"] as? String
        var posterUrl = posters["thumbnail"] as String
       
        if(segue.identifier == "movieSegue"){
            
            let vc = segue.destinationViewController as PosterViewController
            vc.posterUrl  = posterUrl
            vc.descriptionText = textdesc!
            
            
        }
    }
   

}
