//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
/*:
 ## **It’s time for school!**
 
 Aaron suffers from attention deficit disorder. This means he is easily distracted.
 One thing he is passionate about is the weather, especially the clouds. When he looks in their direction he can't take his eyes off them. As you remember, Aaron has to go to school, but he can't get away from looking at those passing clouds.
 Let's help him get to school!
 
 **Challenge**: Give Aaron the right number of steps to get to school!

 Start setting the [int](glossary://int) `numberOfSteps` [variable](glossary://variable) with the number of steps you think are enough for Aaron to reach the school. Next, enter the `moveAaron()` function inside the [for-in](glossary://for-in) to allow Aaron to perform all the steps that you chose.
 * callout(For-in Statement):
 `for item in collection {`\
 `    statements`\
 `}`

Use the suggested tips and then tap `Run My Code` to show the changes you made.
Once you're done, enjoy the *next page*!
 
 [**Next Page**](@next)
 */
//#-hidden-code

import Foundation
import SpriteKit
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
var count = 0
sendValue(.integer(Int(28)))
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, moveAaron())
//#-end-hidden-code
let numberOfSteps : Int = /*#-editable-code*/0/*#-end-editable-code*/
//#-hidden-code
count += numberOfSteps
if count>27{
    count = 27
}else if count < 3  && count > 0{
    count = 3
}else{
}
public func moveAaron(){
    let value = count
    sendValue(.integer(Int(value)))
}


func checkAssessment() {
    if count >= 27 {
        #if !(arch(i386) || arch(x86_64))
        PlaygroundPage.current.assessmentStatus = .pass(message: "Correct! ✅ Aaron is now finally at school! Now let's go to the [next page](@next).")
        #else
        print ("*Assessment successfull*")
        #endif
    } else {
        #if !(arch(i386) || arch(x86_64))
        PlaygroundPage.current.assessmentStatus = .fail(hints: ["Try to add more steps in order to let Aaron get to school. Just re-edit the values and then tap `Run my code`! Aaron will start from where he was at the beginning.", "Add the suggested function `moveAaron()` inside the for statement."], solution: "Give at least 27 steps.")
        #else
        debugPrint("*Assessment failed* - the red arrow is still visible!")
        #endif
    }
}
//#-end-hidden-code
for i in 0 ... numberOfSteps {
    //#-hidden-code
    if i == numberOfSteps {
//#-end-hidden-code
   /*#-editable-code*/<#let Aaron move#>/*#-end-editable-code*/
//#-hidden-code
}
//#-end-hidden-code
}
//#-hidden-code
DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(count/2)) {
    checkAssessment()
}
//#-end-hidden-code




