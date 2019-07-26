//
//  ViewController.swift
//  testWebViewApp
//
//  Created by Mohamed on 7/16/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController , WKNavigationDelegate , UISearchBarDelegate{

    
    @IBOutlet weak var backbutton: UIButton!
    @IBOutlet weak var webview: WKWebView!
    
    @IBOutlet weak var ActionDialoge: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://www.3l-bab.com/?fbclid=IwAR2fbf8BbDDpRE2u76aYQNpmrp2EajHrvxKUukpd2YPeG-zRK37CG1NYYmw")
        
        let request = URLRequest(url: url!)
        
        webview.load(request)
        
        webview.addSubview(ActionDialoge)
        ActionDialoge.startAnimating()
        webview.navigationDelegate = self
        ActionDialoge.hidesWhenStopped = true
        if CheckInternet.Connection(){
            
            // self.Alert(Message: "Connected")
            
        }
            
        else{
            
            self.Alert(Message: "يرجي الاتصال بالانترنت٫٫٫")
            
        }
        

    }
   
   
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        
      ActionDialoge.startAnimating()
        
    }
    
   
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        ActionDialoge.stopAnimating()
        
        backbutton.isEnabled = webView.canGoBack
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
        ActionDialoge.stopAnimating()
    }
    
    @IBAction func btn_Back(_ sender: Any) {
    
        if webview.canGoBack{
            
            webview.goBack()
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        if CheckInternet.Connection(){
            
           // self.Alert(Message: "Connected")
            
        }
            
        else{
            
            self.Alert(Message: "يرجي الاتصال بالانترنت٫٫٫")
            
        }
        
    }
    
    func Alert (Message: String){
        
        let alert = UIAlertController(title: "تنبيه", message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
}

