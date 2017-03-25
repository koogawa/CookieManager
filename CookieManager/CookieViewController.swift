//
//  CookieViewController.swift
//  Demo
//
//  Created by koogawa on 2017/03/25.
//  Copyright © 2017年 koogawa. All rights reserved.
//

import UIKit

class CookieViewController: UIViewController {

    var cookie: HTTPCookie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let textView = UITextView(frame: CGRect(origin: self.view.frame.origin, size: self.view.frame.size))
        textView.isEditable = false
        self.view.addSubview(textView)
        textView.text = cookie?.description

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
