//
//  GameScene.swift
//  GuappyHorse
//
//  Created by Hahn.Chan on 01/04/2017.
//  Copyright © 2017 Hahn Chan. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private let skyColor = UIColor.init(red: 113.0 / 255.0,
                                        green: 197.0 / 255.0,
                                        blue: 207.0 / 255/0,
                                        alpha: 1.0)
    let movingNode = SKNode()
    let birdNode = BirdNode()
    var movePipesAndRemove: SKAction!
    var canRestart = false
    var isGameStared = false
    
    struct PhysicsCategory {
        static let bird: UInt32 = 1 << 0
        static let world: UInt32 = 1 << 1
        static let pipe: UInt32 = 1 << 2
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = skyColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector.init(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        
        addChild(movingNode)
        
        //bird
        birdNode.position = CGPoint.init(x: 50, y: view.frame.size.height / 2)
        addChild(birdNode)
        
        //ground
        for i in 0..<(3 + Int(frame.size.width / ( GroundNode.groundTexture.size().width * 2 ))) {
            let node = GroundNode()
            node.setScale(2.0)
            node.position = CGPoint.init(x: CGFloat(i) * node.size.width, y: node.size.height / 2)
            movingNode.addChild(node)
        }
        
        //sky
        for i in 0..<(3 + Int(frame.size.width / (SkylineNode.skylineTexture.size().width * 2))) {
            let node = SkylineNode()
            node.setScale(2.0)
            node.zPosition = -20
            node.position = CGPoint.init(x: CGFloat(i) * node.size.width, y: node.size.height / 2 + SkylineNode.skylineTexture.size().height * 2)
            movingNode.addChild(node)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        //make sure the bird doesn't get out of the window
        if birdNode.position.y > size.height - birdNode.size.height {
            birdNode.position = CGPoint.init(x: 50, y: size.height - birdNode.size.height)
        }
        
        if isGameStared {
            let value = birdNode.physicsBody!.velocity.dy * (birdNode.physicsBody!.velocity.dy < 0 ? 0.001 : 0.001)
            birdNode.zRotation = min( max(-1, value), 0.5)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isGameStared {
            isGameStared = true
            physicsWorld.gravity = CGVector.init(dx: 0, dy: -5)
            for _ in touches {
                birdNode.physicsBody?.velocity = CGVector.init(dx: 0, dy: 0)
                birdNode.physicsBody?.applyImpulse(CGVector.init(dx: 0, dy: 7.5))
            }
        } else {
            if movingNode.speed > 0 {
                for _ in touches {
                    birdNode.physicsBody?.velocity = CGVector.init(dx: 0, dy: 0)
                    birdNode.physicsBody?.applyImpulse(CGVector.init(dx: 0, dy: 7.5))
                }
            }
        }
    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        if movingNode.speed > 0 {
            movingNode.speed = 0
        }
    }
}
