//
//  HeroViewController.swift
//  Heros
//
//  Created by Marcelo Block Teixeira on 22/06/20.
//  Copyright © 2020 Marcelo Block Teixeira. All rights reserved.
//

import UIKit
import WebKit

class HeroViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    var hero: Result!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: hero.urls.first!.url)
        let request = URLRequest(url: url!)
        
        title = hero.name
        
//        webView.allowsBackForwardNavigationGestures = true
//        webView.navigationDelegate = self
        webView.load(request)
        // Do any additional setup after loading the view.
    }
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HeroViewController: WKNavigationDelegate {
      func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
          loading.stopAnimating()
      }
  }
