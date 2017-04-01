//
//  GroundNode.swift
//  GuappyHorse
//
//  Created by Hahn.Chan on 01/04/2017.
//  Copyright © 2017 Hahn Chan. All rights reserved.
//

import UIKit
import SpriteKit

class GroundNode: SKSpriteNode {
    
    static let groundTexture = SKTexture.init(image: #imageLiteral(resourceName: "Ground"))
    
    init() {
        super.init(texture: GroundNode.groundTexture, color: UIColor.clear, size: GroundNode.groundTexture.size())
        GroundNode.groundTexture.filteringMode = .nearest
        let moveAction = SKAction.moveBy(x: -(GroundNode.groundTexture.size().width * 2), y: 0, duration: TimeInterval(0.02 * GroundNode.groundTexture.size().width * 2))
        let resetAction = SKAction.moveBy(x: GroundNode.groundTexture.size().width * 2, y: 0, duration: 0)
        let groupedAction = SKAction.repeatForever(SKAction.sequence([moveAction, resetAction]))
        run(groupedAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
