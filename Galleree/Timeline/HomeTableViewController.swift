//
//  HomeTableViewController.swift
//  Galleree
//
//  Created by Diana Lim on 8/1/16.
//  Copyright © 2016 Natalie Lim. All rights reserved.
//

import UIKit
import ParseUI
import Parse
import Bond

class HomeTableViewController: PFQueryTableViewController {
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        Parse.setApplicationId("galleree", clientKey: "peanutpuppypal")
        
        var tableVC:HomeTableViewController = HomeTableViewController(className: "Post")
        tableVC.title = "Post"
        
        
        
     //   let frame = UIScreen.mainScreen().bounds
     //   window = UIWindow(frame: frame)
        
     //   window!.rootViewController = navigationVC
     //   window!.makeKeyAndVisible()
        
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func queryForTable() -> PFQuery {
        let query:PFQuery = PFQuery(className:self.parseClassName!)
        
        if(objects?.count == 0)
        {
            query.cachePolicy = PFCachePolicy.CacheThenNetwork
        }
        
        query.orderByAscending("name")
        
        return query
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override init(style: UITableViewStyle, className: String!)
    {
        super.init(style: style, className: className)
        
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        self.objectsPerPage = 25
        
        self.parseClassName = className
    }
    
    required init(coder aDecoder:NSCoder)
    {
        fatalError("NSCoding not supported")  
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
