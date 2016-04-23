//
//  InitialViewController.swift
//  my-little-monster
//
//  Created by Amadeu Andrade on 20/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation
import UIKit

class InitialViewController: UIViewController {
    
    var character = ""

    @IBOutlet weak var selectCharLbl: UIImageView!
    @IBOutlet weak var beginLbl: UILabel!
    @IBOutlet weak var beginBtn: UIButton!
    @IBOutlet weak var diggletBtn: UIButton!
    @IBOutlet weak var golemBtn: UIButton!

    @IBAction func onDiggletPressed(sender: AnyObject) {
        character = "Digglet"
        golemBtn.hidden = true
        selectCharLbl.hidden = true
        beginBtn.hidden = false
        beginLbl.hidden = false
    }
    
    @IBAction func onGolemPressed(sender: AnyObject) {
        character = "Golem"
        diggletBtn.hidden = true
        selectCharLbl.hidden = true
        beginBtn.hidden = false
        beginLbl.hidden = false
    }
    
    @IBAction func onBeginPressed(sender: AnyObject) {
        performSegueWithIdentifier("showMonster", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showInitialScreen()
    }
    
    @IBAction func unwindToInitialViewController(segue: UIStoryboardSegue) {
        showInitialScreen()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showMonster") {
            let svc = segue.destinationViewController as! ViewController;
            svc.choosenCharacter = character
            
        }
    }
    
    func showInitialScreen() {
        character = ""
        diggletBtn.hidden = false
        golemBtn.hidden = false
        selectCharLbl.hidden = false
        beginBtn.hidden = true
        beginLbl.hidden = true
    }

    
}