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
    var monsterHappy = false
    var gameAudio: GameAudio!
    
    var actualPenalties = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameAudio = GameAudio()
        gameAudio.playCaveMusicSound()
        
        food.dropTarget = monsterImg
        heart.dropTarget = monsterImg
        
        skull1.alpha = DIM_ALPHA
        skull2.alpha = DIM_ALPHA
        skull3.alpha = DIM_ALPHA
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.itemDroppedOnTarget), name: "onTargetDropped", object: nil)
        
        startTimer()
    }
    
    func itemDroppedOnTarget() {
        monsterHappy = true
        startTimer()
        food.alpha = DIM_ALPHA
        heart.alpha = DIM_ALPHA
        food.userInteractionEnabled = false
        heart.userInteractionEnabled = false
    }
    
    func startTimer() {
        if timer != nil {
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.changeGameState), userInfo: nil, repeats: true)
    }
    
    func changeGameState() {
        
        if !monsterHappy {
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
        
        let rand = arc4random_uniform(2)
        
        if rand == 0 {
            food.alpha = DIM_ALPHA
            food.userInteractionEnabled = false
            heart.alpha = OPAQUE
            heart.userInteractionEnabled = true
        } else {
            heart.alpha = DIM_ALPHA
            heart.userInteractionEnabled = false
            food.alpha = OPAQUE
            food.userInteractionEnabled = true
        }
        
        monsterHappy = false
        
    }
    
    func gameOver() {
        timer.invalidate()
        heart.alpha = DIM_ALPHA
        food.alpha = DIM_ALPHA
        monsterImg.playDeathAnimation()
    }
    
    


}

