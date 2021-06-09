//#-hidden-code
//
//  Contents.swift
//
//  Created by Ciro Sannino on 15/03/2019.
//
//
//#-end-hidden-code
/*:
 ## **Get to class.**
 
 Now Aaron is at school and, having managed to stop looking at the clouds, he must get to class on time. There is a lot of noise in the corridor (turn the volume up to hear it) and in these situations he becomes overwhelmed and panics.
 
 Remember the headphones he took earlier?
 
 They also help him cope in high noise environments.
 Help Aaron reach the classroom having him wear the headphones if the noise is too `high`.
 
 **Challenge**: Complete the `if` statement in order to let Aaron reach the classroom.
 
 If the noise is too high, Aaron must wear his headphones. Implement the [`if` statement](glossary://if%20statement) to check the noise value.
 
 * callout(If statement):
 `if  condition {`\
 `    do something`\
 `}`
 
 Later, if he feels comfortable, he will walk to his classroom.
 */
//:Tap `Run My Code` to show the changes you made.
//#-hidden-code
import UIKit
import SpriteKit
import PlaygroundSupport
import Foundation

public struct Noise1 {
    public var isHigh : Bool
    public var isLow : Bool
}

var noise = Noise1(isHigh:true, isLow:false)
var hasAaronWarnHisHeadPhones : Bool = false
var hasAaronReachedClass : Bool = false

PlaygroundPage.current.needsIndefiniteExecution = true
var valore = 2
sendValue(.integer(Int(3)))

func reachClass(){
    if hasAaronWarnHisHeadPhones == true {
        valore = 1 }else{ valore = 2}
    let value = valore
    hasAaronReachedClass = true
    sendValue(.integer(Int(value)))
}

func wearHeadphones(){
    let value = 0
    hasAaronWarnHisHeadPhones = true
    sendValue(.integer(Int(value)))
}

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, noise, ., isHigh, wearHeadphones())
//#-end-hidden-code
if (/*#-editable-code*/<#Check noise value#>/*#-end-editable-code*/){
    /*#-editable-code*/<#Wear headphones#>/*#-end-editable-code*/
}
reachClass()
//#-hidden-code

let solution = """
```
if (noise.isHigh) {
    wearHeadphones()
}
```
"""
func checkAssessment() {
    print ("Checking assessment")

    if hasAaronWarnHisHeadPhones == false {
        #if !(arch(i386) || arch(x86_64))
        PlaygroundPage.current.assessmentStatus = .fail(hints: ["If the noise is too high Aaron should wear his headphones"], solution: solution)
        #else
        debugPrint("*Assessment failed* - the red arrow is still visible!")
        #endif
    } else {
        #if !(arch(i386) || arch(x86_64))
        PlaygroundPage.current.assessmentStatus = .pass(message: "Correct! ✅ Aaron can now start his school day. Thank you for your help! 👋🏼 ")
        #else
        print ("*Assessment successfull*")
        #endif
    }
}

if hasAaronWarnHisHeadPhones == true {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 12.5) {
        checkAssessment()
    }
}else {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
        checkAssessment()
    }
}
//#-end-hidden-code

