//
//  ViewController.swift
//  toto
//
//  Created by Simon SICARD on 4/3/17.
//  Copyright © 2017 Simon SICARD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        print("UIButtons numbers pressed\(sender.tag-1)")
        if performingMath == true
        {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else
        {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        print("UIButton buttons pressed\(sender.tag)")

        if label.text != "" && sender.tag != 13 && sender.tag != 12 && sender.tag != 10
        {
            if label.text == "*" || label.text == "+" || label.text == "-" || label.text == "/"
            {
                label.text = String(previousNumber);
                operation = sender.tag
                performingMath = true
            }
            else
            {
                previousNumber = Double(label.text!)!
                if sender.tag == 11 // multiply
                {
                    label.text = "*";
                }
                else if sender.tag == 14 // plus
                {
                    label.text = "+";
                }
                else if sender.tag == 15 // minus
                {
                    label.text = "-";
                }
                else if sender.tag == 16 // divide
                {
                    label.text = "/";
                }
                operation = sender.tag
                performingMath = true
            }
        }
        else if sender.tag == 12
        {
            if operation == 11
            {
                label.text = String(previousNumber * numberOnScreen);
            }
            else if operation == 14
            {
                label.text = String(previousNumber + numberOnScreen);
            }
            else if operation == 15
            {
                label.text = String(previousNumber - numberOnScreen);
            }
            else if operation == 16
            {
                label.text = String(previousNumber / numberOnScreen);
            }
        }
        else if sender.tag == 10
        {
            numberOnScreen = -numberOnScreen;
            label.text = String(numberOnScreen);
            
        }
        else if sender.tag == 13
        {
            label.text = "";
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }

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

