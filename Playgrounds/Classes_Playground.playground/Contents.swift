//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class Vehicle {
    var wheelNum = 4
    var speed = 25
    var mpg = 20
    let tankCapacity = 20
    var name : String?
    
    func changeSpeed(amount: Int){
        speed = speed + amount
    }
    
    func changeEfficientcy(newSpeed: Int, newmpg: Int){
        speed = newSpeed
        mpg = newmpg
    }
    init(vehicleName vname: String){
        name = vname
    }
    init(){
    }
}

let myJeep = Vehicle()
myJeep.mpg
myJeep.speed
myJeep.name

let myHybrid = Vehicle(vehicleName: "Prius")
if myHybrid.name != nil{
    print(myHybrid.name!)
}

myJeep.changeSpeed(amount: 67)
myJeep.speed
myJeep.changeEfficientcy(newSpeed: 75, newmpg: 18)
myJeep.speed
myJeep.mpg

class Bicycle: Vehicle{
    var reflectors = false
    
    // _ means no named parameter or no external parameter name
    init(_ ref: Bool, _ name: String){
        reflectors = ref
        //calling the initializer of the super class AKA Vehicle
        super.init(vehicleName: name)
        // using the super class to change the wheel num inside of bicycle class
        self.wheelNum = 2
    }
    
    override init() {
        super.init()
    }
}

var bike = Bicycle(false, "Taylor")
bike.wheelNum
bike.reflectors
bike.name

// both new__bike and bike refer to the same spot in memery
// remember that what ever i pass in will reflect in both bike and new_bike
var new_bike = bike
new_bike.reflectors
new_bike.reflectors = true
new_bike.reflectors
bike.reflectors




//strucs are value types
struct Skateboard {
    var color : String
    var type : String
}

var board = Skateboard(color: "Orange", type: "Trick Deck")
board.color
board.type

// these two are no longer connected. Changing one no longer changes the other
// with a struct
var new_board = board
new_board.color = "Purple"
board.color
new_board.color




// arrays

//three different ways to create an array below:
var myList2: [String] // creating a variable array of type string, but it has not been initialized yet
var myList = [String]() // initialiizing the array variable
var shoppingList = ["Cereal", "Milk"]
print(shoppingList[0])

// adding items to array
shoppingList.append("Bread")

if shoppingList.isEmpty{
    print("There is nothing you need")
} else {
    print("You need \(shoppingList.count)" + " items")
}

//
let item = shoppingList.removeLast()
print("\(shoppingList.count)")

shoppingList.insert("Coffee", at: 0)
let oldItem = shoppingList.remove(at: 1)




//dictionaries

var newList:[String:String]
var classes:[String: String] = ["tay": "ari", "drew": "noone"]
classes["tay"]
classes["tay"] = "dummy"
classes.count

classes.updateValue("Mobile App Dev", forKey: "drew")
classes["drew"]
classes.removeValue(forKey: "drew")
classes.count

