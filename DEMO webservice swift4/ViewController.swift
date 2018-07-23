//
//  ViewController.swift
//  DEMO webservice swift4
//
//  Created by Umesh Kumar Patel on 21/07/18.
//  Copyright © 2018 Confiance labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


//      let urlString = "http://mobileappdevelop.co/TIPIT/webservice/get_my_groups?user_id=5"
//        let url = NSURL(string: KeyPath)
//        let session = URLSession.sharedSession
//        let task = session.dataTaskWithURL(url!) { data, response, error in
//            print("Task completed")
//
//            guard data != nil && error == nil else {
//                print(error?.localizedDescription)
//                return
//            }
//
//            do {
//                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
//                    if let results = jsonResult["result"] as? NSArray {
//                        dispatch_async(dispatch_get_main_queue()) {
//                            self.tableData = results
//                            self.Indextableview.reloadData()
//                        }
//                    }
//                }
//            } catch let parseError as NSError {
//                print("JSON Error \(parseError.localizedDescription)")
//            }
//        }
//
//        task.resume()
//    }
    
    
        let url = URL(string: "http://mobileappdevelop.co/TIPIT/webservice/get_my_groups?user_id=5")
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                
                 print(json)
                
                let posts = json["posts"] as? [[String: Any]] ?? []
                print(posts)
            } catch let error as NSError {
                print(error)
            }
            
        }).resume()
    
    }
    
}    
        
//        navigationItem.title = "REST API"
//
//
//
//        //Implementing URLSession
////        let urlString = "http://mobileappdevelop.co/TIPIT/webservice/get_my_groups?user_id=5"
//        let url = NSURL(string: "http://mobileappdevelop.co/TIPIT/webservice/get_my_groups?user_id=5")!
//        let task = URLSession.shared.dataTask(with: url as URL) { (data, response, error) -> Void in
//            print("Task completed")
//            if let data = data {
//                do {
//                    if let jsonResult = try JSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
//                        DispatchQueue.main.async() {
//                            if let results: NSArray = jsonResult["result"] as? NSArray {
//
//                                print(result)
//                        }
//
//                    }
//                    }
//                }
//        }
//        task.resume()
//
//    }
//}


