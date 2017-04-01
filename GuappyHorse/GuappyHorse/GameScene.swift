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
    
    override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = skyColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        addChild(movingNode)
        
        birdNode.position = CGPoint.init(x: 50, y: view.frame.size.height / 2)
        addChild(birdNode)
        
        for i in 0..<(3 + Int(frame.size.width / ( GroundNode.groundTexture.size().width * 2 ))) {
            let node = GroundNode()
            node.setScale(2.0)
            node.position = CGPoint.init(x: CGFloat(i) * node.size.width, y: node.size.height / 2)
            movingNode.addChild(node)
        }
        
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
    }
}
