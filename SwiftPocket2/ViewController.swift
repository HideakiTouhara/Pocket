//
//  ViewController.swift
//  SwiftPocket2
//
//  Created by HideakiTouhara on 2017/10/12.
//  Copyright © 2017年 HideakiTouhara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count: Int = 0

    @IBOutlet weak var webView: UIWebView!
    
    var urlArray = [String]()
    var urlString:String? = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "titleArray") != nil {
            urlArray = UserDefaults.standard.object(forKey: "urlArray") as! [String]
            urlString = urlArray[count]
        }
        
        let requestURL = URL(string: urlString!)
        let req = NSURLRequest(url: requestURL!)
        webView.loadRequest(req as URLRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

