//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import UIKit
import SpriteKit
import PlaygroundSupport
import Foundation

public var insideSchoolView = instantiateLiveView(chapter: 1, page: 3)
// Instantiate a new instance of the live view from the book's auxiliary sources and pass it to PlaygroundSupport.
PlaygroundPage.current.liveView = insideSchoolView
