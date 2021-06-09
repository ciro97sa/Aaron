//
//  SchoolScene.swift
//  Book_Sources
//
//  Created by Ciro Sannino on 15/03/2019.
//

import UIKit
import SpriteKit
import PlaygroundSupport

@objc(SchoolScene)
public class SchoolScene: SKScene, SKPhysicsContactDelegate {
    
    public var schoolbus : Schoolbus!
    public var door  : SKSpriteNode!
    public var player : Player!
    public var sidewalk : SKSpriteNode!
    public var firstPosition : CGPoint!
    public var maxOfSteps : Int = 27
    public var numberOfSteps : Int = 0
    
    override public func sceneDidLoad() {
        
        if let schoolbusNode = childNode(withName: "//Schoolbus") as! Schoolbus? {
            self.schoolbus = schoolbusNode
            self.schoolbus.isPaused = false
        }
        if let doorNode = childNode(withName: "//Door") as? SKSpriteNode{
            self.door = doorNode
        }
        
        if let playerNode = childNode(withName: "//Player") as? Player{
            self.player = playerNode
            self.player.setup()
            self.player.buildWalkPlayer()
            self.player.isPaused = true
            self.player.texture = SKTexture(imageNamed: "AaronWatchingClouds")
            firstPosition = self.player.position
            
        }
        
        if let sidewalkNode = childNode(withName: "//Sidewalk") as? SKSpriteNode{
            self.sidewalk = sidewalkNode
            self.sidewalk.physicsBody?.categoryBitMask = CollisionBitMask.sidewalkCategory
        }
        
        addClouds()
    
    }
    
    override public func didMove(to view: SKView) {
        self.backgroundColor = #colorLiteral(red: 0.4980392157, green: 0.662745098, blue: 0.8509803922, alpha: 1)
        self.physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
    }
    
    
    public func movePlayer(times: Int) {
        player.move(times:times)
    }
    
   public func didBegin(_ contact: SKPhysicsContact) {
        let firstBody = contact.bodyA
        let secondBody = contact.bodyB
        
        if firstBody.categoryBitMask == CollisionBitMask.sidewalkCategory && secondBody.categoryBitMask == CollisionBitMask.playerCategory || firstBody.categoryBitMask == CollisionBitMask.playerCategory && secondBody.categoryBitMask == CollisionBitMask.sidewalkCategory {
            debugPrint("Player touched sidewalk")
        }else if firstBody.categoryBitMask == CollisionBitMask.playerCategory && secondBody.categoryBitMask == CollisionBitMask.doorCategory || firstBody.categoryBitMask == CollisionBitMask.doorCategory && secondBody.categoryBitMask == CollisionBitMask.playerCategory{
            debugPrint("EndFirstScene")
        }
    }
    
    
    
    
    //MARK: addClouds() -This function is called in didMove to generate clouds in the scene with a random Y.
    
    @objc func addClouds(){
        let cloudTexture = SKTexture(imageNamed: "Cloud")
        let randomCloudY = CGFloat(arc4random_uniform(UInt32((self.scene?.frame.height)!/4))+UInt32((self.scene?.frame.height)!/4))
        let cloud = SKSpriteNode(texture: cloudTexture, size: CGSize(width: 120, height: 70))
        cloud.zPosition=0
        cloud.position = CGPoint(x: -(self.scene?.frame.width)!/2-2*cloud.size.width, y: randomCloudY-cloud.frame.size.height/2)
        addChild(cloud)
        let moveCloudAction = SKAction.moveTo(x:(self.scene?.frame.size.width)!, duration : 30.0)
        let moveCloudThenDestroyAction = SKAction.sequence([moveCloudAction,SKAction.removeFromParent()])
        cloud.run(moveCloudThenDestroyAction)
        let randomTime = TimeInterval(arc4random_uniform(6)+5)
        Timer.scheduledTimer(timeInterval: randomTime, target: self, selector: #selector(addClouds), userInfo: nil, repeats: false)
        
        
    }

    public override func update(_ currentTime: TimeInterval) {
        schoolbus.moveIn(scene: scene)
        
    }
}
