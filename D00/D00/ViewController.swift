//
//  ViewController.swift
//  D00
//
//  Created by Simon SICARD on 4/3/17.
//  Copyright © 2017 Simon SICARD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var textLabel: UILabel!
    @IBAction func clickButton(_ sender: UIButton) {
        print("Hello World !")
        textLabel.text = "Changed !"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

