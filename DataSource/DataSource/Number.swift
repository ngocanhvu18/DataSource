//
//  Number.swift
//  DataSource
//
//  Created by NgocAnh on 5/23/18.
//  Copyright © 2018 NgocAnh. All rights reserved.
//

import UIKit
class NumberData: NSObject, UITableViewDataSource {
    var number = Array(1...5)
    var masterView : MasterViewController?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(number[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            number.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            masterView?.hasNoData = number.count == 0
        } else if editingStyle == .insert{
            
        }
    }
  
}
