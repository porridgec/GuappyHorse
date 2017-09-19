//
//  BirdNode.swift
//  GuappyHorse
//
//  Created by Hahn.Chan on 01/04/2017.
//  Copyright © 2017 Hahn Chan. All rights reserved.
//

import UIKit
import SpriteKit

class BirdNode: SKSpriteNode {
    
    let textureNormal = SKTexture.init(image: #imageLiteral(resourceName: "Bird1"))
    let textureFlap = SKTexture.init(image: #imageLiteral(resourceName: "Bird2"))
    var textures: [SKTexture] = []

    init() {
        super.init(texture: textureNormal, color: UIColor.clear, size: textureNormal.size())
        textures.append(textureNormal)
        textures.append(textureFlap)
        textures.forEach{ $0.filteringMode = SKTextureFilteringMode.nearest }
        setScale(2)
        
        physicsBody = SKPhysicsBody.init(circleOfRadius: size.height / 2)
        physicsBody?.isDynamic = true
        physicsBody?.allowsRotation = true
        physicsBody?.categoryBitMask = GameScene.PhysicsCategory.bird
        physicsBody?.contactTestBitMask = GameScene.PhysicsCategory.pipe | GameScene.PhysicsCategory.world
        
        run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.1)))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
