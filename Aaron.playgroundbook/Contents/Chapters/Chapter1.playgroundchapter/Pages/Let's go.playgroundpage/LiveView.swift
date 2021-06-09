//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import UIKit
import SpriteKit
import PlaygroundSupport


public let schoolView = instantiateLiveView(chapter: 1, page: 2)
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, movePlayer())
//#-editable-code
//#-end-editable-code

// Instantiate a new instance of the live view from the book's auxiliary sources and pass it to PlaygroundSupport.
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = schoolView

