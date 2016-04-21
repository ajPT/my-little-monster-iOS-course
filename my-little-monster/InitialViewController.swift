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

    @IBAction func doStuff(sender: AnyObject) {
        
        performSegueWithIdentifier("showMonster", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func unwindToInitialViewController(segue: UIStoryboardSegue) {
        //nothing goes here
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showMonster") {
            let svc = segue.destinationViewController as! ViewController;
            svc.choosenCharacter = "Digglet"
            
        }
    }

    
}