//
//  CollisionMask.swift
//  Playgrounds Author Template Extension
//
//  Created by Ciro Sannino on 18/03/2019.
//

import SpriteKit

//MARK:- CollisionBitMask
struct CollisionBitMask {
    static let playerCategory: UInt32 = 0x1 << 1
    static let doorCategory: UInt32 = 0x1 << 2
    static let sidewalkCategory: UInt32 = 0x1 << 3
    static let deskCategory: UInt32 = 0x1 << 4
}

