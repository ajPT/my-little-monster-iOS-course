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
    
    let DIM_ALPHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    var timer: NSTimer!
    
    var actualPenalties = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        food.dropTarget = monsterImg
        heart.dropTarget = monsterImg
        
        skull1.alpha = DIM_ALPHA
        skull2.alpha = DIM_ALPHA
        skull3.alpha = DIM_ALPHA
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.itemDroppedOnTarget), name: "onTargetDropped", object: nil)
        
        startTimer()
    }
    
    func itemDroppedOnTarget() {
        print("is Working!!!")
    }
    
    func startTimer() {
        if timer != nil {
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.changeGameState), userInfo: nil, repeats: true)
    }
    
    func changeGameState() {
        
        actualPenalties += 1
        
        if actualPenalties == 1 {
            skull1.alpha = OPAQUE
        } else if actualPenalties == 2 {
            skull2.alpha = OPAQUE
        } else if actualPenalties >= 3 {
            skull3.alpha = OPAQUE
            gameOver()
        } else {
            skull1.alpha = DIM_ALPHA
            skull2.alpha = DIM_ALPHA
            skull3.alpha = DIM_ALPHA
        }
    }
    
    func gameOver() {
        timer.invalidate()
        monsterImg.playDeathAnimation()
    }
    
    


}

