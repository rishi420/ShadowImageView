//
//  ViewController.swift
//  ShadowImageView
//
//  Created by Warif Akhand Rishi on 8/4/19.
//  Copyright © 2019 Warif Akhand Rishi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aImageView.dropShadow()
    }

    

}

