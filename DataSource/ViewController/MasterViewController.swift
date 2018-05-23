//
//  MasterViewController.swift
//  DataSource
//
//  Created by NgocAnh on 5/23/18.
//  Copyright © 2018 NgocAnh. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    var dataNumber = NumberData()
    var dataString = StringData()
    var hasNoData : Bool = false {
        didSet{
            hasNoData ? (tableView.backgroundView = noData):(tableView.backgroundView = footView)
        }
    }
    @IBOutlet var noData: UIView!
    
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet var footView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataString
        dataString.masterView = self
        dataNumber.masterView = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switchButton.isOn ? (hasNoData = (dataString.string.count == 0)):(hasNoData=(dataNumber.number.count == 0))
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchClick(_ sender: UISwitch) {
        sender.isOn ? (tableView.dataSource = dataString) : (tableView.dataSource = dataNumber)
        sender.isOn ? (hasNoData = (dataString.string.count == 0)):(hasNoData=(dataNumber.number.count == 0))
        tableView.reloadData()
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */
    @IBAction  func unwind(for unwindSegue: UIStoryboardSegue) {
        guard let detailViewCotroller = unwindSegue.source as? DetailViewController else {return}
            if let  index = tableView.indexPathForSelectedRow {
                switchButton.isOn ? (dataString.string[index.row] = detailViewCotroller.name ?? "") : (dataNumber.number[index.row] = Int(detailViewCotroller.name ?? "") ?? 0)
                
            
            }else {
                switchButton.isOn ? (dataString.string.append(detailViewCotroller.name ?? "")) : (dataNumber.number.append(Int(detailViewCotroller.name ?? "") ?? 0))
        
    }
        tableView.reloadData()
    }
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier ?? "") == "edit" {
        if let viewController = segue.destination as? DetailViewController {
            if let index = tableView.indexPathForSelectedRow {
                viewController.name = switchButton.isOn ? (dataString.string[index.row]) : String(dataNumber.number[index.row])
                
            }
        }
        
    }
    }


