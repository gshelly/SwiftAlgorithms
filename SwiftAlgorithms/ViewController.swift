//
//  ViewController.swift
//  SwiftAlgorithms
//
//  Created by Shelly Gupta on 12/14/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(twoSum([2,7,11,15], 9))
        
//        NotificationCenter.default.addObserver(self, selector: #selector(showData(_:)), name: Notification.Name("TransferData"), object: nil)
        CustomNotificationCenter.shared.addObserver(observer: self, completionHandler: {[weak self] info in
            self?.dataLabel.text = info as? String
        }, name: "TransferData", object: nil)
    }

    @IBAction func nextButton(_ sender: Any) {
        let nextVc = BViewController(nibName: "BViewController", bundle: Bundle(for: type(of: self)))
        
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    @objc func showData(_ notification: Notification) {
        dataLabel.text = notification.userInfo?["Data"] as? String
    }
}

