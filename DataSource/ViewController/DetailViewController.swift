//
//  ViewController.swift
//  DataSource
//
//  Created by NgocAnh on 5/23/18.
//  Copyright © 2018 NgocAnh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var name : String?
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if name != nil {
            nameTextField.text = name
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard nameTextField.text != ""  else {return}
        name = nameTextField.text
    }

}

