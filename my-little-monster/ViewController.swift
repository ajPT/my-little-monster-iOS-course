//
//  ViewController.swift
//  my-little-monster
//
//  Created by Amadeu Andrade on 17/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var heart: DragImg!
    @IBOutlet weak var food: DragImg!
    @IBOutlet weak var skull1: UIImageView!
    @IBOutlet weak var skull2: UIImageView!
    @IBOutlet weak var skull3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        food.dropTarget = monsterImg
        heart.dropTarget = monsterImg
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.itemDroppedOnTarget), name: "onTargetDropped", object: nil)
        
    }
    
    func itemDroppedOnTarget() {
        print("is Working!!!")
    }


}

