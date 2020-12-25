import UIKit

//different types of variables
var str = "hello" //string
var there:String = "there" // explicit declaration of string
var age = 24 //int
var weight = 70.45 //double (more precise than float and is default of swift)
var weightOne:Float = 70.45 //float
var flag = true //Boolean

str = "hi" //valid as variable declared using var can be re-assigned

let string = "yes" //variable declared using let cannot be re-assigned

var temp: String = str + " " + there //valid
print("\(temp), I am \(age) year old.") //valid

var length = 5
var width = 2
let area = length * width
var division = length / width
var remainder = length % width
age = age + 2 //one way of doing add or subtract
age += 2 //another way to add or subtract

var emp = [22.3,22.34,44.32] //array
var empOne: [Double] = [22.3,22.34,44.32]
//var empTwo = [22.3,22.34,44.32,"hi"] not allowed

var empThree = [String]() //initializing an empty array list
var empFour: [String] //declaring an array list but not initializing it

//Dictionary (key, value)

var namesOfIntegers = [Int: String]()
namesOfIntegers[0] = "zero"
namesOfIntegers[1] = "one"
namesOfIntegers[2] = "two"
namesOfIntegers[2] = nil //removing
print(namesOfIntegers)
for (i, j) in namesOfIntegers{
    print("\(i) : \(j)")
}
for keys in namesOfIntegers.keys{
    print("key : \(keys)")
}
namesOfIntegers = [:] //resets
print(namesOfIntegers)

//Functions

func calculateArea(length: Int, width: Int) -> Int { // '->' means that the function will return something
    return length * width
}
print(calculateArea(length: 2, width: 3))

var bankbalance = 1000.00
print(bankbalance)

func calculate(currentBalance: inout Double, itemPrice: Double){ //inout lets the code modify values directly through parameters in function
    if itemPrice <= currentBalance {
        currentBalance = currentBalance - itemPrice
    }else{
        print("Yo! you seriously need to save.")
    }
}

calculate(currentBalance: &bankbalance, itemPrice: 200)
print(bankbalance)

// nil/null safety and structs

struct Person{
    let firstName: String
    let middleName: String?
    let lastName: String
    func printfullName() {
        let middle = middleName ?? "" //this is written to handle nil and equal to 3 lines written below
        /*if middleName == nil {
            middle = ""
        }*/
        print("\(firstName) \(middle) \(lastName)")
    }
}

var aPerson = Person(firstName: "first", middleName: nil, lastName: "last")
var personTwo = Person(firstName: "first", middleName: "middle", lastName: "last")
aPerson.printfullName()
personTwo.printfullName()

//class

class Pear{
    let firstName: String
    let middleName: String?
    let lastName: String
    let spouse: Pear?
    
    init(firstName: String, middleName: String?, lastName: String, spouse: Pear?) {
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
        self.spouse = spouse
    }
    
    func getFullName() -> String {
        let middle = middleName ?? ""
        return "\(firstName) \(middle) \(lastName)"
    }
}

var pearOne = Pear(firstName: "first", middleName: "middle", lastName: "last", spouse: nil)

print(pearOne.spouse?.getFullName() ?? "no spouse name found") //optional chaining

/*
 loops
 */

//repeat-while
var index = 0
repeat{
    index += 1
    print(index) // prints from 1 till 5 (including 5)
}
while (index < 5)

//while
while index < 10 { // prints from 5 till 10 (including 10) and works similar to the above loop
    index += 1
    print(index)
}

index = 5

//for
for i in 0..<index {
    print(i) // prints from 1 till 4
}
for sal in emp {
    print(sal)
}


/*
 object oriented Programming
*/

class Vehicle {
    var tires = 4
    var headlights = 2
    var horsepower = 468
    var model = ""
    
    func brake(){}
}

let bmw = Vehicle()
bmw.model = "328i"

let ford = Vehicle()
ford.model = "F150"
ford.brake()

func passByReference(vehicle: Vehicle){
    vehicle.model = "cheese"
}

print(ford.model)

passByReference(vehicle: ford) //Pass by reference

print(ford.model)

//inheretence

class VehicleOne {
    var tires = 4
    var make: String?
    var model: String?
    var currentSpeed: Double = 2
    
    init() {
        print("I am the Parent")
    }
    
    func drive(speedIncrease: Double){
        currentSpeed += speedIncrease * 2
        print(carTemp.currentSpeed)
    }
    func brake(){}
}

class SportsCar: VehicleOne {
    
    override init() {
        super.init()
        print("I am the Child!")
        make = "BMW"
        model = "3 series"
    }
    
    override func drive(speedIncrease: Double) {
        currentSpeed += speedIncrease * 3
        print(carTemp.currentSpeed)
    }
}

let carTemp = SportsCar()

carTemp.drive(speedIncrease: 10)
print(carTemp.currentSpeed)

//polymorphism

class Shape {
    var area: Double?
    
    func calculateArea(valA: Double, valB: Double){}
}

class Triangle: Shape {
    
    override func calculateArea(valA: Double, valB: Double) {
        area = (valA * valB) / 2
    }
}

class Rectangle: Shape {
    override func calculateArea(valA: Double, valB: Double) {
        area = valB * valA
    }
}

/* protocol */

protocol CanFly {
    func fly()
}

class Bird{
    let isFemale = true
    
    func canLayEggs(){
        if isFemale {
            print("Can Lay eggs")
        }
    }
}

class Eagle: Bird, CanFly {
    func fly()  {
        print("Can Fly")
    }
}

struct Airplane: CanFly { //protocol can be used with struct while inheritance of class is limited to class
    func fly() {
        print("can fly!!")
    }
}

struct FlyMuseum{
    func flyingDemo(flyingObj: CanFly) {
        flyingObj.fly()
    }
}

let EagleOne = Eagle()
let AirplaneOne = Airplane()
let MuseumOne = FlyMuseum()

MuseumOne.flyingDemo(flyingObj: EagleOne)
MuseumOne.flyingDemo(flyingObj: AirplaneOne)

/* Closure */

func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int{
    return operation(n1, n2)
}

func multiply(n1: Int, n2: Int) -> Int {
    return n1 * n2
}

calculator(n1: 2, n2: 3, operation: multiply(n1:n2:)) //normal way to pass funtions

let res = calculator(n1: 2, n2: 3, operation: {(n1: Int, n2: Int) -> Int in return n1 * n2}) //more adanced way
print(res)

let res1 = calculator(n1: 2, n2: 3, operation: {(n1, n2) -> Int in return n1 * n2}) 

let resOne = calculator(n1: 2, n2: 3, operation: {$0 * $1}) //most advanced way to pass function (swift interprets $0 as 1st parameter and so on...)
print(resOne)

let dummyArr = [2,3,4,5,6,7,8,9]
print(dummyArr.map({$0 + 1}))
