//
//  DragImg.swift
//  my-little-monster
//
//  Created by Amadeu Andrade on 18/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation
import UIKit

class DragImg: UIImageView {

    var originalPosition: CGPoint!
    var dropTarget: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPosition = self.center
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.locationInView(self.superview)
            self.center = CGPointMake(position.x, position.y)
        }
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first, let target = dropTarget {
            //let position = touch.locationInView(self.superview) -> doesn't work in landscape
            //OPTION 1:
//            let position = touch.locationInView(touch.view!.window)
//            if CGRectContainsPoint(target.frame, position)  {
//                let notif = NSNotification(name: "onTargetDropped", object: nil)
//                NSNotificationCenter.defaultCenter().postNotification(notif)
//            }
            //OPTION 2:
            let position = touch.locationInView(target)
            if target.pointInside(position, withEvent: event) {
                let notif = NSNotification(name: "onTargetDropped", object: nil)
                NSNotificationCenter.defaultCenter().postNotification(notif)
            }
        }
        self.center = originalPosition
    }
    
}