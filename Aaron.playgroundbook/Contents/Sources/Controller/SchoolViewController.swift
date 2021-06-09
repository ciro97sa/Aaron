//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Provides supporting functions for setting up a live view.
//

import UIKit
import Foundation
import PlaygroundSupport
import SpriteKit

public class SchoolViewController: LiveViewController {
    
    public var schoolScene : SchoolScene!
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        if let view = view as? SKView {
            if let scene = SKScene(fileNamed: "SchoolScene") as? SchoolScene {
                scene.scaleMode = .aspectFit
                self.schoolScene = scene
                view.presentScene(self.schoolScene)
            }
        }
    }

    override public func receive(_ message: PlaygroundValue) {
        guard case .integer(let messageData) = message else {return}
        if messageData == 28{
            let wait = SKAction.wait(forDuration: 1.5)
            let reloadScene = SKAction.run {
                self.schoolScene.player.texture = SKTexture(imageNamed: "AaronWatchingClouds")
                self.schoolScene.player.position.x = self.schoolScene.firstPosition.x
            }
            let sequence = SKAction.sequence([wait,reloadScene])
            self.schoolScene.run(sequence)
            
        }else{
            if messageData == 0{
                
            }else{
        let action1 = SKAction.wait(forDuration: 2)
            let action2 = SKAction.run {
                self.schoolScene.movePlayer(times : messageData)
            }
            let sequence = SKAction.sequence([action1,action2])
            self.schoolScene.run(sequence)
            }
        }
    }
}
