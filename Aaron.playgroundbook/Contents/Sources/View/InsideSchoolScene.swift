//
//  InsideSchoolScene.swift
//  Playgrounds Author Template Extension
//
//  Created by Ciro Sannino on 18/03/2019.
//

import UIKit
import SpriteKit
import PlaygroundSupport
import AVFoundation

@objc(InsideSchoolScene)
public class InsideSchoolScene: SKScene, SKPhysicsContactDelegate {
    
    public var player : Player!
    public var sidewalk : SKSpriteNode!
    public var audioPlayer : AVAudioPlayer!
    public var noise = Noise(isHigh: true, isLow: false)
    public var lockers : SKSpriteNode!
    public var playerHasReachedClass : Bool = false
    
    public var hasAaronWornHisHeadsetOn : Bool = false
    
    
    override public func sceneDidLoad() {
        if let playerNode = childNode(withName: "//Player") as? Player{
            self.player = playerNode
            self.player.setup()
            self.player.buildWalkPlayer()
            self.player.buildTiredPlayer()
            self.player.buildWearHeadSetPlayer()
            self.player.buildWalkPlayerWithHeadset()
            self.player.buildWalkTiredPlayer()
            self.player.texture = SKTexture(imageNamed: "AaronTired1")
            self.player.isPaused = true
            
            
        }
        
        if let lockersNode = childNode(withName: "//Lockers") as? SKSpriteNode{
            self.lockers = lockersNode
        }
        
        if let sidewalkNode = childNode(withName: "//InsideSchoolSidewalk") as? SKSpriteNode{
            self.sidewalk = sidewalkNode
        }
        
        self.camera = childNode(withName: "//Camera") as? SKCameraNode
        
        
        noise.isHigh = true
        
    }
    
    override public func didMove(to view: SKView) {
        self.backgroundColor = #colorLiteral(red: 0.4980392157, green: 0.662745098, blue: 0.8509803922, alpha: 1)
        self.physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        playSound()
        self.player.texture = SKTexture(imageNamed: "AaronTired1")
        
    }
    
    func playerTiredReaction(){
        self.player.playerReactToSound()
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "schoolAudio", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let audioPlayer = audioPlayer else { return }
            audioPlayer.volume = 0
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
            audioPlayer.setVolume(0.4, fadeDuration: 5)
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        
    }
    
    public func stopSound(){
        if audioPlayer.isPlaying == true{
        audioPlayer.stop()
    }
    }
    
    public func moveWithNoise(){
        self.player.moveTired()
    }
    
    
    public func wearHeadset(){
        if playerHasReachedClass == false{
        if noise.isHigh == true {
            self.noise.isHigh = false
            self.player.removeAction(forKey: "aaronTiredAtSchool")
            self.hasAaronWornHisHeadsetOn = true
            self.player.animatePlayerWearingHeadset()
                self.player.run(SKAction.wait(forDuration: 1), completion: {
                    self.audioPlayer.setVolume(0.1, fadeDuration: 1.5)
            })
        }else{
        }
        
        }else{
            
        }
    }
    
    public func reachClass(){
        if playerHasReachedClass == false{
        let waitAction = SKAction.wait(forDuration: 2.5)
        
        self.player.run(SKAction.sequence([waitAction, SKAction.group([SKAction.run {self.player.animateWalkPlayerWithHeadset()}, SKAction.moveTo(x: self.lockers.frame.maxX+30, duration: 8)])]), completion: {
                let move = SKAction.moveBy(x:60, y: 70 , duration: 3)
                let moveStraight = SKAction.moveBy(x: 150, y: 0, duration: 3)
                let resize = SKAction.resize(toWidth: 100, height: 219, duration: 3)
                let group = SKAction.group([moveStraight,move,resize])
                let cameraZoom = SKAction.run {
                    self.camera?.run(SKAction(named: "CameraZoom")!)
                }
                let sequence = SKAction.sequence([group, cameraZoom ])
                let action = SKAction.run {
                    self.stopSound()
                }
                let sequence1 = SKAction.sequence([sequence,action])
                self.player.run(sequence1, completion: {
                    self.player.texture = SKTexture(imageNamed: "AaronWearingHeadset9")
                    self.playerHasReachedClass = true
                    self.player.isPaused = true
                    
                })
            })
        } else {
            
        }
    }
    
    
        
    public func tryReachClass(){
           self.player.tryReachClass()
    
    }}
