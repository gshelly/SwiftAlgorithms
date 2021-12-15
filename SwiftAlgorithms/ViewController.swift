//
//  ViewController.swift
//  SwiftAlgorithms
//
//  Created by Shelly Gupta on 12/14/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(twoSum([2,7,11,15], 9))
    }

}

