//
//  WebViewController.swift
//  BMIpgt21
//
//  Created by 박기태 on 2022/12/06.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!

    @IBAction func goMyBlog(_ sender: UIButton) {
        guard let url = URL(string: "https://velog.io/@bak418") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "https://velog.io/@bak418") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    override func viewWillAppear(_ animated: Bool) {
        print("Web1111")
    }
    
}
