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
/*
 *loops
 */

var index = 0
repeat{
    index += 1
    print(index) // prints from 1 till 5 (including 5)
}
while (index < 5)

while index < 10 { // prints from 5 till 10 (including 10) and works similar to the above loop
    index += 1
    print(index)
}
index = 5
for i in 0..<index {
    print(i) // prints from 1 till 4
}
for sal in emp {
    print(sal)
}

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
