

import UIKit
import Foundation
import PlaygroundSupport
import SpriteKit

public class HomeViewController : LiveViewController {
    
    public var homeScene : HomeScene!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        if let view = view as? SKView {
            if let scene = SKScene(fileNamed: "HomeScene") as? HomeScene {
                scene.scaleMode = .aspectFit
                self.homeScene = scene
                view.presentScene(self.homeScene)
            }
        }
        
    }
    
     override public func receive(_ message: PlaygroundValue) {

        guard case .integer(let messageData) = message else {return}
        switch messageData {
        case 1:
            self.homeScene.takeHeadset()
        default : debugPrint()
        }
    }
}
