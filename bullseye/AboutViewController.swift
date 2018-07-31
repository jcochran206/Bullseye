//
//  AboutViewController.swift
//  bullseye
//
//  Created by Jonathan Cochran on 7/26/18.
//  Copyright © 2018 Jonathan Cochran. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html"){
         if let htmlData = try? Data(contentsOf: url) {
         let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
         webView.load(htmlData, mimeType: "text/HTML", textEncodingName: "UTF-8", baseURL: baseURL)
            }
         }
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

}
