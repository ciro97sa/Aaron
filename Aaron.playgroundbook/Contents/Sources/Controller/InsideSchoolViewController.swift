
import UIKit
import Foundation
import PlaygroundSupport
import SpriteKit
import AVFoundation

public class InsideSchoolViewController: LiveViewController {
    
    public var insideSchoolScene : InsideSchoolScene!
    
    public override func viewDidLoad() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        if let view = view as? SKView {
            if let scene = SKScene(fileNamed: "InsideSchoolScene") as? InsideSchoolScene {
                scene.scaleMode = .aspectFit
                self.insideSchoolScene = scene
                view.presentScene(self.insideSchoolScene)
            }
        }
        
    }
    
    
    @objc func appMovedToBackground() {
        PlaygroundPage.current.finishExecution()
    }
    
    override public func receive(_ message: PlaygroundValue) {
        guard case .integer(let messageData) = message else { return }
                switch messageData {
                case 0:
                        let action = SKAction.wait(forDuration: 1)
                        let action1 = SKAction.run {
                            self.insideSchoolScene.wearHeadset()
                        }
                    let sequence = SKAction.sequence([action,action1])
                    self.insideSchoolScene.run(sequence)
                    
                case 1:
                      self.insideSchoolScene.reachClass()
                case 2:
                    if self.insideSchoolScene.playerHasReachedClass == false{
                        self.insideSchoolScene.playerTiredReaction()
                    }else{}
                case 3:
                    if self.insideSchoolScene.playerHasReachedClass == false{
                        self.insideSchoolScene.hasAaronWornHisHeadsetOn = false
                self.insideSchoolScene.player.texture = SKTexture(imageNamed: "AaronTired1")
                        self.insideSchoolScene.player.removeAllActions()}
                    else{}
                default : fatalError("No Int value")
                }
        
         }

    }

