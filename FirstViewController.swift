//
//  FirstViewController.swift
//  To Do List
//
//  Created by TejaSwaroop on 13/02/19.
//  Copyright © 2019 Suraj. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items = [String]()
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        if let tempItems = itemsObject as? [String] {
            items = tempItems
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let itemsObjects = UserDefaults.standard.object(forKey: "items")
        if let tempItems = itemsObjects as? [String] {
            items = tempItems
        }
        table.reloadData()
    }


    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        var cellLabel = ""
        if let tempLabel = items[indexPath.row] as? String {
            cellLabel = tempLabel
        }
        cell.textLabel?.text = cellLabel
        return cell
    }
    
}

