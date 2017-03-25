//
//  CookiesViewController.swift
//  CookieManager
//
//  Created by koogawa on 2017/03/25.
//  Copyright © 2017 koogawa. All rights reserved.
//

import UIKit

public class CookiesViewController: UITableViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Cookie Manager"

        let cancelButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                              target: self,
                                              action: #selector(CookiesViewController.didTapCancelButton))
        self.navigationItem.leftBarButtonItem = cancelButtonItem

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Private method

    @objc private func didTapCancelButton() {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view delegate

    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cookies = HTTPCookieStorage.shared.cookies else {
            return
        }

        let cookieViewController = CookieViewController()
        cookieViewController.cookie = cookies[indexPath.row]
        self.navigationController?.pushViewController(cookieViewController, animated: true)
    }

    // MARK: - Table view data source

    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cookies = HTTPCookieStorage.shared.cookies {
            return cookies.count
        }
        return 0
    }

    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reuseIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
            cell?.accessoryType = .disclosureIndicator
        }

        // Configure the cell...
        if let cookies = HTTPCookieStorage.shared.cookies {
            let cookie = cookies[indexPath.row]
            cell?.textLabel?.text = cookie.domain
            cell?.detailTextLabel?.text = "\(cookie.name) = \(cookie.value)"
        }

        return cell!
    }

    // Override to support editing the table view.

    override public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard let cookies = HTTPCookieStorage.shared.cookies else {
            return
        }

        if editingStyle == .delete {
            // Delete the cookie from the cookie storage
            let cookie = cookies[indexPath.row]
            HTTPCookieStorage.shared.deleteCookie(cookie)

            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
}
