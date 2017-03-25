//
//  ViewController.swift
//  Demo
//
//  Created by koogawa on 2017/03/25.
//  Copyright © 2017 koogawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let kHomeUrl = "https://google.com/"

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var backButtonItem: UIBarButtonItem!
    @IBOutlet weak var forwardButtonItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.webView.loadRequest(URLRequest(url: URL(string: kHomeUrl)!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapCookiesButton(_ sender: Any) {
        let viewController = CookiesViewController()
        let naviController = UINavigationController(rootViewController: viewController)
        self.present(naviController, animated: true, completion: nil)
    }

    @IBAction func didTapBackButton(_ sender: Any) {
        self.webView.goBack()
    }

    @IBAction func didTapForwardButton(_ sender: Any) {
        self.webView.goForward()
    }

    @IBAction func didTapRefreshButton(_ sender: Any) {
        self.webView.reload()
    }

    @IBAction func didTapSearchButton(_ sender: Any) {
        self.webView.loadRequest(URLRequest(url: URL(string: kHomeUrl)!))
    }

    // MARK: - UIWebViewDelegate

    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.backButtonItem.isEnabled = self.webView.canGoBack
        self.forwardButtonItem.isEnabled = self.webView.canGoForward
    }
}

