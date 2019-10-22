//
//  WebKitViewController.swift
//  WebViewWebKit
//
//  Created by Gene Backlin on 10/21/19.
//  Copyright © 2019 Gene Backlin. All rights reserved.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController {
    @IBOutlet weak var wkWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let pdfDataURL = (UIApplication.shared.delegate as! AppDelegate).pdfURL {
            wkWebView.load(URLRequest(url: pdfDataURL))
            wkWebView.navigationDelegate = self
            //wkWebView.loadFileURL(pdfDataURL, allowingReadAccessTo: pdfDataURL)
        }
    }
}

// MARK: - WKNavigationDelegate

extension WebKitViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        debugPrint("didStartProvisionalNavigation")
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        debugPrint("didFinish")
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        guard (error as NSError).code != URLError.cancelled.rawValue else { return }

        let msg = "\(error.localizedDescription) - Code: \((error as NSError).code)"
        debugPrint("didFailProvisionalNavigation: \(msg)")
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        debugPrint("decidePolicyFor navigationAction")
        decisionHandler(.allow)
    }
}
