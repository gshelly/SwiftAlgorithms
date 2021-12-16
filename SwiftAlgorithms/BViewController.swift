//
//  BViewController.swift
//  SwiftAlgorithms
//
//  Created by Shelly Gupta on 12/16/21.
//

import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func previousButton(_ sender: Any) {
//        NotificationCenter.default.post(name: Notification.Name("TransferData"), object: nil, userInfo: ["Data": "Data received"])
        CustomNotificationCenter.shared.post(name: "TransferData", notificationInfo: "Data received")
        navigationController?.popViewController(animated: true)
    }
    
    deinit {
        print("deinitialation")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
