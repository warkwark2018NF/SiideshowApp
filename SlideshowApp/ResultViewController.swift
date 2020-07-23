//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by FUSAMAMASAKI on 2020/07/17.
//  Copyright © 2020 FUSAMAMASAKI. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var LargeView: UIImageView!
    var x:UIImage! = UIImage(named:"gu")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        LargeView.image = x
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
