//
//  MonsterImg.swift
//  my-little-monster
//
//  Created by Amadeu Andrade on 18/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playIdleAnimation()
    }
    
    func playIdleAnimation () {
        self.image = UIImage(named: "idle (1)")
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for index in 1...4 {
            let img = UIImage(named: "idle (\(index))")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playDeathAnimation() {
    
        self.image = UIImage(named: "dead5")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for index in 1...5 {
            let img = UIImage(named: "dead\(index)")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
    }

}