//
//  String.swift
//  DataSource
//
//  Created by NgocAnh on 5/23/18.
//  Copyright © 2018 NgocAnh. All rights reserved.
//

import UIKit

class StringData:NSObject,UITableViewDataSource{
    var  string = ["mot", "hai", "ba", "bon", "nam"]
    
    var masterView : MasterViewController?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return string.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = string[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            string.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            masterView?.hasNoData = string.count == 0
        }else
            if editingStyle == .insert{
        }
    }
}

