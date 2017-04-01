//
//  SkylineNode.swift
//  GuappyHorse
//
//  Created by Hahn.Chan on 01/04/2017.
//  Copyright © 2017 Hahn Chan. All rights reserved.
//

import UIKit
import SpriteKit

class SkylineNode: SKSpriteNode {

    static let skylineTexture = SKTexture.init(image: #imageLiteral(resourceName: "Skyline"))
    
    init() {
        super.init(texture: SkylineNode.skylineTexture, color: UIColor.clear, size: SkylineNode.skylineTexture.size())
        SkylineNode.skylineTexture.filteringMode = .nearest
        let moveAction = SKAction.moveBy(x: -(SkylineNode.skylineTexture.size().width * 2), y: 0, duration: TimeInterval(0.1 * SkylineNode.skylineTexture.size().width * 2))
        let resetAction = SKAction.moveBy(x: SkylineNode.skylineTexture.size().width * 2, y: 0, duration: 0)
        let groupedAction = SKAction.repeatForever(SKAction.sequence([moveAction, resetAction]))
        run(groupedAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
