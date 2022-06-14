//
//  GameViewController.swift
//  Snake_lesson_8_1
//
//  Created by Елена Русских on 13.06.2022.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        
        skView.presentScene(scene)
    }

}
