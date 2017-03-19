//
//  GameScene.swift
//  Breakthrough
//
//  Created by Ryan Lee on 1/7/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var leftBumper = SKSpriteNode()
    var rightBumper = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        leftBumper = self.childNode(withName: "leftFlipper") as! SKSpriteNode
        rightBumper = self.childNode(withName: "rightFlipper") as! SKSpriteNode
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)        
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            if touchLocation.x < 0 {
                //flip up left bumper
                print("touched left")
                
//                let flip = [SKAction.run({() -> Void in
//                }), SKAction.rotate(toAngle: -45 * .pi / 180, duration: 0.1), SKAction.run({() -> Void in
//                })]
//                
//                self.leftBumper.run(SKAction.sequence(flip))
                
                self.leftBumper.run(SKAction.rotate(toAngle: -45, duration: 0.8))
                
            } else if touchLocation.x > 0 {
                //flip up right bumper
                print("touched right")
                self.rightBumper.run(SKAction.rotate(toAngle: -45, duration: 0.8))
            }
            
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch.location(in: self).x < 0 {
                self.leftBumper.run(SKAction.rotate(toAngle: 0, duration: 0.5))
            } else if touch.location(in: self).x > 0 {
                self.rightBumper.run(SKAction.rotate(toAngle: 0, duration: 0.5))
            }
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}


//// Touch on Flippers logic
//if touchLocation.x > 188 && touchLocation.y < 500 {
//    //        NSLog(@"Right Flipper Tapped");
//    var sequence = [SKAction.runBlock({() -> Void in
//        self.rightFlipperActive = true
//    }), SKAction.rotate(toAngle: -45 * .pi / 180, duration: 0.1), SKAction.runBlock({() -> Void in
//        self.rightFlipperActive = false
//    })]
//    self.rightFlipper.runAction(SKAction.sequence(sequence))
//}
//if touchLocation.x < 188 && touchLocation.y < 500 {
//    //        NSLog(@"Left Flipper Tapped");
//    var sequence = [SKAction.runBlock({() -> Void in
//        self.leftFlipperActive = true
//    }), SKAction.rotate(toAngle: +45 * .pi / 180, duration: 0.1), SKAction.runBlock({() -> Void in
//        self.leftFlipperActive = false
//    })]
//    self.leftFlipper.runAction(SKAction.sequence(sequence))
//}
