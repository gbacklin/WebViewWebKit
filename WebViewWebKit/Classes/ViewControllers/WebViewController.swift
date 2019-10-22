//
//  WebViewController.swift
//  WebViewWebKit
//
//  Created by Gene Backlin on 10/21/19.
//  Copyright © 2019 Gene Backlin. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let pdfDataURL = (UIApplication.shared.delegate as! AppDelegate).pdfURL {
            if let pdfData = (UIApplication.shared.delegate as! AppDelegate).pdfData {
                webView.load(pdfData, mimeType: "application/pdf", textEncodingName:"", baseURL: pdfDataURL.deletingLastPathComponent())
            }
        }
    }
}
