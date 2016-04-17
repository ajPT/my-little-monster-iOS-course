//
//  ViewController.swift
//  my-little-monster
//
//  Created by Amadeu Andrade on 17/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImg: UIImageView!
    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var food: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imgArray = [UIImage]()
        
        for index in 1...4 {
            let img = UIImage(named: "idle (\(index))")
            imgArray.append(img!)
        }
        
        monsterImg.animationImages = imgArray
        monsterImg.animationDuration = 0.8
        monsterImg.animationRepeatCount = 0 //0 = infinite
        monsterImg.startAnimating()
        
        
    }


}

