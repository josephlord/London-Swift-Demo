//
//  ViewController.swift
//  London Swift Demo
//
//  Created by Joseph on 06/08/2014.
//  Copyright (c) 2014 Human Friendly Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Need to have something that owns the behaviours beyond the function life.
    var animator:UIDynamicAnimator!
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let blueV = UIView(frame: CGRect(x: 20, y: 50, width: 80, height: 80))
        blueV.backgroundColor = UIColor.blueColor()
        
        // The main view will retain the subview
        self.view.addSubview(blueV)
        self.animator = UIDynamicAnimator(referenceView: view)
        
        let gravityBehaviour = UIGravityBehavior(items: [blueV])
        animator.addBehavior(gravityBehaviour)
        
        let collisionBehaviour = UICollisionBehavior(items: [blueV])
        collisionBehaviour.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisionBehaviour)
        
        let itemBehaviour = UIDynamicItemBehavior(items: [blueV])
        itemBehaviour.addLinearVelocity(CGPoint(x: 200, y: 30), forItem: blueV)
        itemBehaviour.elasticity = 0.99 // Bouncyness
        itemBehaviour.addAngularVelocity(0.5, forItem: blueV)
        animator.addBehavior(itemBehaviour)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

