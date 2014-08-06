func introduction() {
    println("Hello and Welcome")
    sleep(1)
    println("I'm Joseph Lord, I'm currently an independent developer creating iOS and Rails software")
    sleep(4)
    println("My company is called Human-Friendly")
    sleep(3)
    println("Email me if you want iOS coaching (Swift or Objc), a contractor or if you have an interesting full time job.")
     sleep(2)
    println("Email: joseph@human-friendly.com")
    println("Blog: http://blog.human-friendly.com")
    
}


// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let str2 = "Hello London Swift"

str = "Hello, everyone"


//str2 = "thdj"



println("Hello")


//let a = introduction()






// Demonstration that array assignment is a copy (actually copy on write
// but you can treat it as a copy. Changed to this in Beta 3
var foo = [1,2,3]
var empty = [Int]()

var bar = foo
bar == foo
bar[0] = 0
bar == foo
foo
bar
bar[0] = 1
bar




/** This demonstrates asyncronous calls - Advanced See "Grand Central Dispatch"
documentation. For a nice Swift wrapper see https://github.com/duemunk/Async*/

// Note that "This is run on the background queue" is printed after "When did this print?"
// It may not be fully deterministic though.
/*
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
    println("This is run on the background queue")
    
    // Doesn't really work in playground as main queue doesn't run as normal
    // Normally this is the way to pass information back to the UI thread
       /*dispatch_async(dispatch_get_main_queue() ){
        println("This is run on the main queue, after the previous block")
    } */
}
*/

println("When did this print?")





// In the Fibonachi sequence each number is the sum of the two
// previous numbers
// 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610
// Dumb fibonachic implementation O(2^n) complexity I think
func fib(i:Int)->Int {
    if i < 3 {
        return 1
    } else {
        let (x,y) = (fib(i - 1), fib(i - 2))
        i
        x
        return x+y
    }
}
println(fib(5))



/** This is a generic class to contain an array so that it can be shared rather
than being copied. It is used in the memoising fibonachi function below.

*/
class ArrayObjectWrapper<A> {
    var arry:[A]
    init() {
        arry = [A]()
    }
    init(capacity: Int, value:A) {
        arry = [A](count: capacity, repeatedValue: value)
    }
    
    subscript(index: Int) -> A {
        get {
            return arry[index]
        }
        set(newValue) {
            arry[index] = newValue
        }
    }
    
}

// This uses the provided array which must have space for i items
// All contents should either negative (if not set) or equal to the
// Fibonachi number of the index. It will fill int the values as it calculates
// new values and uses the values when set if they exist to avoid expensive
// calculation - Easiest to call fibMem to automatically create and initialise
// the array although you could build up a bigger common cache of the results if
// you wanted.
func fibMemIntern(i:Int, arry:ArrayObjectWrapper<Int>)->Int {
    if i < 3 {
        return 1
    }
    //let memVal = arry.arry[i]
    let memVal = arry[i]
    if memVal > -1 {
        return memVal
    }
    let (x,y) = (fibMemIntern(i-1, arry), fibMemIntern(i-2, arry))
    i
    let res = x + y
    //arry.arry[i] = res
    arry[i] = res
    return res
}

// Call this function to run the efficient Fibonachi
func fibMem(i:Int)->Int {
    return fibMemIntern(i, ArrayObjectWrapper<Int>(capacity:i+1, value: -5))
}

println(fibMem(10))
/*
println()
for i in 1..<16 {
    let f = fibMem(i)
    f

    print("\(f), ")
}
*/

