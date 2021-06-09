//
//  HomeScene.swift
//  Playgrounds Author Template Extension
//
//  Created by Ciro Sannino on 18/03/2019.
//

import UIKit
import SpriteKit
import PlaygroundSupport

@objc(HomeScene)
public class HomeScene: SKScene, SKPhysicsContactDelegate {
    
    public var player : Player!
    public var window : SKSpriteNode!
    public var computerScreen : SKSpriteNode!
    public var computerScreenLabel : SKLabelNode!
    public var desk : SKSpriteNode!
    public var headphone : SKSpriteNode!
    
    public var isComputerOn : Bool = false
    public var hasPlayerTouchedDesk : Bool = false
    public var hasPlayerAnimated : Bool = false
    
    override public func sceneDidLoad() {
        
        self.physicsWorld.contactDelegate = self
        hasPlayerTouchedDesk = false
        
        if let playerNode = childNode(withName: "//Player") as? Player{
            self.player = playerNode
            self.player.setup()
            self.player.buildWalkPlayerFromHome()
            self.player.buildHeadsetPlayer()
            self.player.isPaused = true
            }
        
        if let windowNode = childNode(withName: "//Window") as? SKSpriteNode{
            self.window = windowNode
        }
        
        if let deskNode = childNode(withName: "//Desk") as? SKSpriteNode{
            self.desk = deskNode
            self.desk.physicsBody?.categoryBitMask = CollisionBitMask.deskCategory
            self.desk.physicsBody?.collisionBitMask = CollisionBitMask.playerCategory
            self.desk.physicsBody?.contactTestBitMask = CollisionBitMask.playerCategory
            
        }
        
        if let screenNode = childNode(withName: "//Screen") as? SKSpriteNode{
            self.computerScreen = screenNode
        }

        if let computerScreenLabelNode = childNode(withName: "//ScreenLabel") as? SKLabelNode{
             self.computerScreenLabel = computerScreenLabelNode
            
        }
        
        if let headphoneNode = childNode(withName: "//Headphone") as? SKSpriteNode{
            self.headphone = headphoneNode
            self.headphone.isHidden = false
        }
        addClouds()
       }
    
    public func takeHeadset(){
        if hasPlayerTouchedDesk == false{
            hasPlayerTouchedDesk=true
         self.player.moveinHome(deskPos: desk.position)
        }}
    
    override public func didMove(to view: SKView) {
    }

   public func didBegin(_ contact: SKPhysicsContact) {
        let firstBody = contact.bodyA
        let secondBody = contact.bodyB
    
    if firstBody.categoryBitMask == CollisionBitMask.deskCategory && secondBody.categoryBitMask == CollisionBitMask.playerCategory || firstBody.categoryBitMask == CollisionBitMask.playerCategory && secondBody.categoryBitMask == CollisionBitMask.deskCategory {
        if hasPlayerAnimated == false{
        hasPlayerAnimated = true
        self.player.removeAllActions()
        self.player.isPaused = true
        self.headphone.isHidden = true
        self.player.animateTakeHeadsetPlayer()}
    }else if firstBody.categoryBitMask == CollisionBitMask.playerCategory && secondBody.categoryBitMask == CollisionBitMask.doorCategory || firstBody.categoryBitMask == CollisionBitMask.doorCategory && secondBody.categoryBitMask == CollisionBitMask.playerCategory{
        if hasPlayerTouchedDesk == false{
            hasPlayerTouchedDesk = true
            self.player.removeAllActions()
            self.player.isPaused = true
            self.player.animateTakeHeadsetPlayer()}
    }
    }
    
    
    //MARK: addClouds() -This function is called in didMove to generate clouds in the scene with a random Y.
    
    @objc func addClouds(){
        let cloudTexture = SKTexture(imageNamed: "Cloud")
        let randomCloudY = CGFloat(arc4random_uniform(UInt32((window.frame.height)/4))+UInt32((window.frame.height)/4))
        let cloud = SKSpriteNode(texture: cloudTexture, size: CGSize(width: 48, height: 28))
        cloud.zPosition=(-2)
        cloud.name = "Cloud"
        
        cloud.position = CGPoint(x: -(window.frame.width)-cloud.size.width, y: randomCloudY-cloud.frame.size.height/2)
        addChild(cloud)
        let moveCloudAction = SKAction.moveTo(x:(window.frame.size.width), duration : 25)
        let moveCloudThenDestroyAction = SKAction.sequence([moveCloudAction,SKAction.removeFromParent()])
        cloud.run(moveCloudThenDestroyAction)
        let randomTime = TimeInterval(arc4random_uniform(6)+5)
        Timer.scheduledTimer(timeInterval: randomTime, target: self, selector: #selector(addClouds), userInfo: nil, repeats: false)

    
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = self.atPoint(location)
            
            if touchedNode.name == "Screen" || touchedNode.name == "ScreenLabel"{
                if isComputerOn == false {
                    self.isComputerOn = true
                let fadeIn = SKAction.fadeIn(withDuration: 0.5)
                    self.computerScreenLabel.run(fadeIn)
                }else{
                    self.isComputerOn = false
                 let fadeOut = SKAction.fadeOut(withDuration: 0.5)
                    self.computerScreenLabel.run(fadeOut)
            }}
        }}
    
    public override func update(_ currentTime: TimeInterval) {
        
    }
    
    
}
