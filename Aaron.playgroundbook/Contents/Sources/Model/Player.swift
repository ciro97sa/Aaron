//
//  Player.swift
//  Playgrounds Author Template Extension
//
//  Created by Ciro Sannino on 18/03/2019.
//

import UIKit
import SpriteKit
import PlaygroundSupport

@objc(Player)
public class Player: SKSpriteNode {
    
    //texture for the player (Aaron)
    public var playerTextureWalk: [SKTexture] = []
    public var playerTextureTakeHeadset: [SKTexture] = []
    public var playerTextureWalkHome: [SKTexture] = []
    public var playerTextureTired: [SKTexture] = []
    public var playerTextureWalkWithHeadset: [SKTexture] = []
    public var playerTextureWearingHeadset: [SKTexture] = []
    public var playerTextureWalkTired : [SKTexture] = []
    
    public var countOfImages : Int?
    
    public func setup() {
        self.physicsBody?.restitution = 0.5
        self.physicsBody?.categoryBitMask = CollisionBitMask.playerCategory
        self.physicsBody?.collisionBitMask = CollisionBitMask.deskCategory
        self.physicsBody?.contactTestBitMask = CollisionBitMask.deskCategory
        self.isPaused = true
    }
    

    public func move(times : Int){
        self.isPaused = false
        animateWalkPlayer()
        let moveAction = SKAction.moveBy(x: CGFloat(times*50), y: 0, duration: TimeInterval(times/2))
        let wait = SKAction.wait(forDuration: 0.5)
        let sequence = SKAction.sequence([moveAction,wait])
        run(sequence) {
            self.isPaused = true
            let firstFrameTexture = self.playerTextureWalk[0]
            self.texture = firstFrameTexture}
        }

    
    public func moveinHome(deskPos : CGPoint) {
        isPaused = false
        animateWalkPlayerFromHome()
        let moveAction = SKAction.move(by: CGVector(dx: deskPos.x-position.x , dy: 0), duration: 5)
        let stopAction = SKAction.run {
            self.isPaused = true
            let firstFrameTexture = self.playerTextureWalkHome[0]
            self.texture = firstFrameTexture
        }
        let moveSequence = SKAction.sequence([moveAction,stopAction])
        self.run(moveSequence, withKey: "movingPlayerInHome")
    }
    
    
    public func moveTired(){
        isPaused = false
        animateWalkTiredPlayer()
        let moveAction = SKAction.moveBy(x: 100, y: 0, duration: 3)
        let end = SKAction.run {
            self.isPaused = true
            let firstFrameTexture = self.playerTextureWalkTired[0]
            self.texture = firstFrameTexture
        }
        let sequence = SKAction.sequence([moveAction,end])
        run(sequence, withKey: "moveTired")
        
    }
    
    //When there is too much noise, Aaron will be tired
    public func playerReactToSound(){
        self.isPaused = false
        animateTiredPlayerAtSchool()
        
    }
    
    
    public func tryReachClass(){
        let firstAction = SKAction.run {
            self.moveTired()
        }
        let secondAction = SKAction.run {
            self.playerReactToSound()
        }
        let sequence = SKAction.sequence([firstAction,secondAction])
        run(sequence)
        
    }
    
    //MARK:- Build texture for player
    
    public func buildWalkPlayer() {
        var walkFrames: [SKTexture] = []
        let numImages = 7
        for i in 1...numImages {
            let playerTextureName = "Aaron\(i)"
            walkFrames.append(SKTexture(imageNamed: playerTextureName))
        }
        playerTextureWalk = walkFrames
        let firstFrameTexture = walkFrames[0]
        texture = firstFrameTexture
    }
    
    public func buildWalkPlayerFromHome(){
        var walkFromHomeFrames: [SKTexture] = []
        let numImages = 7
   for i in 1...numImages {
            let playerTextureName = "AaronHome\(i)"
            walkFromHomeFrames.append(SKTexture(imageNamed: playerTextureName))
        }
        playerTextureWalkHome = walkFromHomeFrames
        let firstFrameTexture = walkFromHomeFrames[0]
        texture = firstFrameTexture
    }
    
    public func buildHeadsetPlayer() {
        var wearHeadsetFrames: [SKTexture] = []
        let numImages = 10
        for i in 1...numImages {
            let playerTextureName = "AaronHeadphone\(i)"
            wearHeadsetFrames.append(SKTexture(imageNamed: playerTextureName))
        }
        playerTextureTakeHeadset = wearHeadsetFrames
    }
    
    public func buildTiredPlayer() {
        var tiredPlayerFrames: [SKTexture] = []
        let numImages = 8
        for i in 1...numImages {
            let playerTextureName = "AaronTired\(i)"
            tiredPlayerFrames.append(SKTexture(imageNamed: playerTextureName))
        }
        playerTextureTired = tiredPlayerFrames
    }
    
    public func buildWalkPlayerWithHeadset(){
        var walkingWithHeadsetFrames: [SKTexture] = []
        let numImages = 7
        for i in 1...numImages {
            let playerTextureName = "AaronWalkingWithHeadset\(i)"
            walkingWithHeadsetFrames.append(SKTexture(imageNamed: playerTextureName))
        }
        playerTextureWalkWithHeadset = walkingWithHeadsetFrames
        
    }
    
    public func buildWearHeadSetPlayer(){
        var wearingHeadsetFrames: [SKTexture] = []
        let numImages = 9
        for i in 1...numImages {
            let playerTextureName = "AaronWearingHeadset\(i)"
            wearingHeadsetFrames.append(SKTexture(imageNamed: playerTextureName))
        }
        playerTextureWearingHeadset = wearingHeadsetFrames
    }
    
    public func buildWalkTiredPlayer(){
        
        var walkTiredHeadsetFrames: [SKTexture] = []
        let numImages = 7
        for i in 1...numImages {
            let playerTextureName = "AaronWalkTired\(i)"
            walkTiredHeadsetFrames.append(SKTexture(imageNamed: playerTextureName))
        }
        playerTextureWalkTired = walkTiredHeadsetFrames
    
    }
    
    //MARK:- Animate texture for player
    
    public func animateWalkPlayer() {
        isPaused = false
        run(SKAction.repeatForever(
            SKAction.animate(with: playerTextureWalk,
                             timePerFrame: 0.15,
                             resize: false,
                             restore: true)),
            withKey:"walkingInPlacePlayer")
    }
    
    public func animateWalkPlayerFromHome(){
        isPaused = false
        run(SKAction.repeatForever(
            SKAction.animate(with: playerTextureWalkHome,
                             timePerFrame: 0.1,
                             resize: false,
                             restore: true)),
            withKey:"walkingInHomePlayer")
        
        
    }
    
    public func animateTiredPlayerAtSchool(){
        isPaused = false
        run(SKAction.repeatForever(
            SKAction.animate(with: playerTextureTired,
                             timePerFrame: 0.1,
                             resize: false,
                             restore: true)),
            withKey:"aaronTiredAtSchool")
        
    }
    
    public func animateTakeHeadsetPlayer(){
        removeAction(forKey: "walkingInHomePlayer")
        isPaused = false
        let moveAction = SKAction.animate(with: playerTextureTakeHeadset, timePerFrame: 0.13)
            let rewindAction = SKAction.run {
            self.texture = self.playerTextureTakeHeadset[self.playerTextureTakeHeadset.count-1]
        }
        let takeHeadsetAction = SKAction.sequence([moveAction,rewindAction])
        run(takeHeadsetAction)
        }
    
    
    public func animateWalkPlayerWithHeadset(){
        isPaused = false
        run(SKAction.repeatForever(
            SKAction.animate(with: playerTextureWalkWithHeadset,
                             timePerFrame: 0.1,
                             resize: false,
                             restore: true)),
            withKey:"aaronMovingWithHeadset")
        
    }
    
    public func animatePlayerWearingHeadset(){
        isPaused = false
        let moveAction = SKAction.animate(with: playerTextureWearingHeadset, timePerFrame: 0.15)
        run(moveAction)
        texture = playerTextureWearingHeadset[playerTextureWearingHeadset.count-1]
    }
    
    public func animateWalkTiredPlayer(){
        isPaused = false
        run(SKAction.repeatForever(
            SKAction.animate(with: playerTextureWalkTired,
                             timePerFrame: 0.1,
                             resize: false,
                             restore: true)),
            withKey:"aaronisWalkingTired")
        }
    
    }
