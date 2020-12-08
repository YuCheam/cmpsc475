//
//  ViewController.swift
//  UIKitIntro
//
//  Created by Kha-Yu Cheam on 12/8/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let frame = CGRect(x: 20, y: 40, width: 100, height: 100)
        let greenView = UIView(frame: frame)
        
        greenView.backgroundColor = UIColor.green
        
        self.view.addSubview(greenView)
    }


}

