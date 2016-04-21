//
//  ViewController.swift
//  my-little-monster
//
//  Created by Amadeu Andrade on 17/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let DIM_ALPHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    var timer: NSTimer!
    var monsterHappy = false
    var gameAudio: GameAudio!
    var currentItem: UInt32 = 0
    var actualPenalties = 0
    var choosenCharacter = "Digglet"

    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var heart: DragImg!
    @IBOutlet weak var food: DragImg!
    @IBOutlet weak var skull1: UIImageView!
    @IBOutlet weak var skull2: UIImageView!
    @IBOutlet weak var skull3: UIImageView!
    @IBOutlet weak var reanimateBtn: UIButton!
    @IBOutlet weak var restartBtn: UIButton!
    @IBOutlet weak var reanimateLbl: UILabel!
    @IBOutlet weak var restartLbl: UILabel!
    @IBOutlet weak var backgroundImg: UIImageView!
    
    
    @IBAction func onReanimatePressed(sender: AnyObject) {
        food.hidden = false
        heart.hidden = false
        reanimateBtn.hidden = true
        reanimateLbl.hidden = true
        restartBtn.hidden = true
        restartLbl.hidden = true
        skull1.alpha = DIM_ALPHA
        skull2.alpha = DIM_ALPHA
        skull3.alpha = DIM_ALPHA
        
        if choosenCharacter == "Golem" {
            monsterImg.playIdleAnimationGolem ()
        } else if choosenCharacter == "Digglet" {
            monsterImg.playIdleAnimationDigglet()
        }
            
        gameAudio.playCaveMusicSound()
        actualPenalties = 0
        currentItem = 0
        monsterHappy = false
        startTimer()
    }

    @IBAction func onRestartPressed(send: AnyObject) {
        //when pressed go back to InitialViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createScenario()
        
        gameAudio = GameAudio()
        gameAudio.playCaveMusicSound()
        
        food.dropTarget = monsterImg
        heart.dropTarget = monsterImg
        
        reanimateBtn.hidden = true
        reanimateLbl.hidden = true
        restartBtn.hidden = true
        restartLbl.hidden = true
        
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
        if currentItem == 0 {
            gameAudio.playHeartSound()
        } else {
            gameAudio.playBiteSound()
        }
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
            gameAudio.playSkullSound()
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
        } else {
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
            currentItem = rand
        }
    }
    
    func gameOver() {
        timer.invalidate()
        heart.hidden = true
        food.hidden = true
        reanimateBtn.hidden = false
        reanimateLbl.hidden = false
        restartBtn.hidden = false
        restartLbl.hidden = false
        //heart.alpha = DIM_ALPHA
        //food.alpha = DIM_ALPHA
        if choosenCharacter == "Golem" {
            monsterImg.playDeathAnimationGolem()
        } else if choosenCharacter == "Digglet" {
            monsterImg.playDeathAnimationDigglet()
        }
        
        gameAudio.playDeathSound()
    }
    
    func createScenario() {
        if choosenCharacter == "Golem" {
            monsterImg.playIdleAnimationGolem ()
            backgroundImg.image = UIImage(named: "bg")
        } else if choosenCharacter == "Digglet" {
            monsterImg.playIdleAnimationDigglet()
            backgroundImg.image = UIImage(named: "bg2")
        }
    }


}

