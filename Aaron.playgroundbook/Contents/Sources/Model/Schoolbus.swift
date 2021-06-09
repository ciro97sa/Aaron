//
//  Schoolbus.swift
//  Playgrounds Author Template Extension
//
//  Created by Ciro Sannino on 18/03/2019.
//

import UIKit
import SpriteKit
import PlaygroundSupport

@objc(Schoolbus)
public class Schoolbus: SKSpriteNode {
    
    public func moveIn(scene:SKScene?){
        if (position.x >= (-(scene?.size.width)!/2)-size.width/2){
            position.x-=1
        }else{
            position.x = (scene?.size.width)!/2+3*size.width/2
        }
    }

}
