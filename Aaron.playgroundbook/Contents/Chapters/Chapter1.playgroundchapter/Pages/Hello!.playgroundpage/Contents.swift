//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
/*:
 ## **Meet Aaron**
 
 Aaron loves music and using his computer. He has Asperger syndrome (AS), a developmental disorder, related to autism. Like many with this syndrome, he feels secure by having a routine.
 For example, he picks up his headphones every single day before school.
 
**Challenge**: Use the suggested function 'takeHeadphones()' to let Aaron take his headphones!
 
So let's help Aaron take his headphones! Use the suggested [function](glossary://function) and then tap `Run My Code` to show the changes you made.
When you're done, enjoy the *next page*!
 
 [**Next Page**](@next)
 */
//#-hidden-code


import Foundation
import SpriteKit
import UIKit
import PlaygroundSupport

var value = 0
 func takeHeadphones(){
    value = 1
    sendValue(.integer(Int(value)))
}
PlaygroundPage.current.needsIndefiniteExecution = true
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, takeHeadphones())
//#-end-hidden-code
//#-editable-code
//#-end-editable-code
//#-hidden-code

func checkAssessment() {
    print ("Checking assessment")
    if value == 0 {
        #if !(arch(i386) || arch(x86_64))
        PlaygroundPage.current.assessmentStatus = .fail(hints: ["Tap on the editable area and take a look to the suggested function"], solution: "Tap on `takeHeadphones()` and than on `Run my code`")
        #else
        debugPrint("*Assessment failed* - the red arrow is still visible!")
        #endif
    } else {
        #if !(arch(i386) || arch(x86_64))
        PlaygroundPage.current.assessmentStatus = .pass(message: "Correct! ✅ Thank you, now Aaron is ready to go to school!  Now let's go to the [next page](@next).")
        #else
        print ("*Assessment successfull*")
        #endif
    }
}
DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
    checkAssessment()
}
//#-end-hidden-code





