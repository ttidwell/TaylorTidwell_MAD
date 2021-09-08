var message : String = "Hello World"
let classMax : Int
classMax = 20

var name  = "Aileen"

print(name)
print("Hi" + name)
print("my name is \(name)")






let a = 42
let b = 0.123
let c = Double(a) + b

print(c)

let violet = ("#EE82EE", 238, 130, 238)
print("Violet is \(violet.0)")
let (hex, red, green, blue) = violet
print("Violet is \(hex)")





// defining variables
let young = "you're young"
let notYoung = "you're not young"
let age = 21

// if statemets
if age < 21{
    print(young)
}
else {
    print(notYoung)
}





// shortened version of if statement
// true == young false == notYoung
age < 21 ? young : notYoung

// switch statements to test out scenerios
switch age{
    case ...5: print("You're a wee bitty one")
    case 6..<21: print("Enjoy school")
    case 22...55: print("Welcome to the real world")
    default: print("I don't know what you're doing")
}

// for loop defined by range
for count in 0...age{
    print("\(count)")
}





// function syntax
func sayHi(){
    print("Hi Class, \(age)")
}
// calling on function
sayHi()

// Functions with arguments passed
func sayHello(first: String, last: String){
    print("Hi \(first) \(last)")
}
// calling on funcitons with arguments passed into function
sayHello(first: "Jimbo", last: "Jenkins")

// creating function with internal and external variables for argument inputs
func sayWhat (firstName first: String, lastName last: String){
    print("what \(first) \(last)")
}
// call function with external variable names
sayWhat(firstName: "Ben", lastName: "Adams")

// underscore is to let you know that is does take a parameter that is unnamed
func sayWhere(_ place: String){
    print(place)
}
// instead of defining parameter with name. you just pass parameter
sayWhere("here")

// function that takes in a string as a parameter but also will return a string
func sayWho (fistName : String, lastName : String) -> String{
    return "Who " + fistName + " " + lastName + "?"
}
// assigning funciton to variable to print value of func
let msg2 = sayWho(fistName: "Alison", lastName: "Gill")
print(msg2)





// variable that is allowed to not have a value. equals nil (or no value at all) if no value is assigned
var score : Int?
print("Score is \(score)")
// now giving score a value
score = 80
// force unwrap the variable with an ! at the end. If value is nil, program will crash.
print(score)
//removing value, not 0, but no value assigned
score = 25

if score != nil {
    print("The score is \(score!)")
}
if let currentScore = score {
    print("My current score is \(currentScore)")
}

// implicitly unwrapped variable 
let newScore : Int! = 95
print("My new score is \(newScore)")
