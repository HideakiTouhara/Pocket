//
//  ListTableViewController.swift
//  SwiftPocket2
//
//  Created by HideakiTouhara on 2017/10/12.
//  Copyright © 2017年 HideakiTouhara. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var titleArray = [String]()
    var urlArray = [String]()
    
    var label1:UILabel = UILabel()
    var label2:UILabel = UILabel()
    
    var webView:UIWebView = UIWebView()
    
    var selectedNumber:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.object(forKey: "titleArray") != nil {
            titleArray = UserDefaults.standard.object(forKey: "titleArray") as! [String]
            urlArray = UserDefaults.standard.object(forKey: "urlArray") as! [String]
        }
        
        tableView.reloadData()
        
        webView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        let requestURL = URL(string: "https://www.google.co.jp")
        let req = NSURLRequest(url: requestURL!)
        webView.loadRequest(req as URLRequest)
        
        self.view.addSubview(webView)
        
        webView.isHidden = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titleArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        label1 = cell.contentView.viewWithTag(1) as! UILabel
        label2 = cell.contentView.viewWithTag(2) as! UILabel
        
        label1.text = titleArray[indexPath.row]
        label2.text = urlArray[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNumber = Int(indexPath.row)
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
            let vc: ViewController = segue.destination as! ViewController
            vc.count = selectedNumber
            
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func add(_ sender: Any) {
        webView.isHidden = true
        
        titleArray.append(webView.stringByEvaluatingJavaScript(from: "document.title")!)
        urlArray.append(webView.stringByEvaluatingJavaScript(from: "document.URL")!)
        
        UserDefaults.standard.set(titleArray, forKey: "titleArray")
        UserDefaults.standard.set(urlArray, forKey: "urlArray")
        
        if UserDefaults.standard.object(forKey: "titleArray") != nil {
            titleArray = UserDefaults.standard.object(forKey: "titleArray") as! [String]
            urlArray = UserDefaults.standard.object(forKey: "urlArray") as! [String]
        }
        
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        webView.isHidden = true
        
        titleArray.append(webView.stringByEvaluatingJavaScript(from: "document.title")!)
        urlArray.append(webView.stringByEvaluatingJavaScript(from: "document.URL")!)
        
        UserDefaults.standard.set(titleArray, forKey: "titleArray")
        UserDefaults.standard.set(urlArray, forKey: "urlArray")
        
        if UserDefaults.standard.object(forKey: "titleArray") != nil {
            titleArray = UserDefaults.standard.object(forKey: "titleArray") as! [String]
            urlArray = UserDefaults.standard.object(forKey: "urlArray") as! [String]
        }
        
        tableView.reloadData()
    }
    
    
    @IBAction func search(_ sender: Any) {
        
        print("tap")
        webView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        let requestURL = URL(string: "https://www.google.co.jp")
        let req = NSURLRequest(url: requestURL!)
        webView.loadRequest(req as URLRequest)
        
        self.view.addSubview(webView)
        
        webView.isHidden = false
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        webView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        let requestURL = URL(string: "https://www.google.co.jp")
        let req = NSURLRequest(url: requestURL!)
        webView.loadRequest(req as URLRequest)
        
        self.view.addSubview(webView)
        
        webView.isHidden = false
    }
    
    

}
