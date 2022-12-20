import UIKit

//--------Variables and Strings-------------//


//Declaring constants

let theAnswerToTheUltimateQuestion = 42
let pi = 3.14159
let myName = "Franklin Cano"

//Declaring variables

var currentTemp = 27
var myAge = 25
var myLocation = "home"

//Boolean values

var isRaining = true

//specifying a type

var restaurantRating: Double = 3

//Operators

let sum = 20 + 20

let result = 32 - sum

//String operations

let greeting = "Good" + "Morning"

let rating = 3.5
var ratingResult = "The Restaurant rating is " + String(rating)

//String interpolation is done by the name of a constant or variable b/w \("and") in a string

ratingResult = "The restaurant rating is \(rating)"

//print

print(ratingResult)


//------Conditionals and Optionals-----------//

//if statements
let isRestaurantOpen = true

if isRestaurantOpen {
    print("Restaurant is open")
} else {
    print("Restaurant is not open")
}

var trafficLightColor = "Yellow"

if trafficLightColor == "Red" {
    print("Stop")
} else if trafficLightColor == "Yellow" {
    print("Caution")
} else if trafficLightColor == "Green" {
    print("GO")
} else {
    print("Invalid Colors")
}

//Switch Statement

trafficLightColor = "Yellow"
switch trafficLightColor {
case "Red":
    print("STOP")
case "Yellow":
    print("Caution")
case "Green":
    print("GO")
default:
    print("Invalid Color")
}



//Optionals and optinal binding

var spouseName: String?
spouseName = nil
print(spouseName ?? "No value in spouseName")
if let spouseTempvar = spouseName {
    let greeting = "Hello, " + spouseTempvar
    print(greeting)
}


//---------Range Operators and Loops----------//

let myRange = 10...20
let myRange2 = 10..<20

for number in myRange2 {
    print(number)
}

//reverses the numbers
for number in (0...5).reversed() {
    print (number)
}

var y = 0
while y < 50 {
    y += 5
    print("y is \(y)")
}

var x = 0
repeat {
    x += 5
    print("x: \(x)")
} while x < 50
            
//-------------------Collection-----------------//

var shoppingList = ["Eggs", "Milk"]

shoppingList.count

shoppingList.isEmpty

shoppingList.append("Cooking Oil")

shoppingList.insert("Chicken", at: 1)

shoppingList[2]

shoppingList[2] = "Soy Milk"

shoppingList

for shoppingListItem in shoppingList {
    print(shoppingListItem)
}

for shoppingListItem in shoppingList[1...] {
    print(shoppingListItem)
}

var contactList = ["Tia" : "+11111111", "uncle" : "22222222", "Disney" : "+333333333", "ferny" : "+4444444444"]

contactList.count

contactList["Frank"] = "+5555555555"

contactList

var oldDictValue = contactList.removeValue(forKey: "Tia")
oldDictValue
contactList


for(name, contactNumber) in contactList {
    print("\(name) : \(contactNumber)")
}

var movieGenres: Set = ["Horror", "Action", "Romantic"]

movieGenres.count

movieGenres.isEmpty

movieGenres.insert("War")

movieGenres

movieGenres.contains("War")

var oldSetValue = movieGenres.remove("Action")

oldDictValue
movieGenres

for genre in movieGenres {
    print(genre)
}

let movieGenres2: Set = ["Science Fiction", "War", "Fantasy"]

movieGenres.union(movieGenres2)
movieGenres.intersection(movieGenres2) //finds simliar values in both lists
movieGenres.subtracting(movieGenres2) //returns a new set
movieGenres.symmetricDifference(movieGenres2) //new set without values common

let movieGenresSubset: Set = ["Horror", "Romantic Comedy"]
let movieGenresSuperset: Set = ["Horror", "Romantic Comedy", "War", "Science Fiction", "Fantasy"]

let movieGenresDisjoint: Set = ["Bollywood"]

movieGenres == movieGenres2
movieGenresSubset.isSubset(of: movieGenres) // checks subset of another list
movieGenresSuperset.isSuperset(of: movieGenres) // checks supset of another list
movieGenresDisjoint.isDisjoint(with: movieGenres) //Checks whether lists have no common value


//----------Functions & Closures-----------------//

func serviceCharge(mealCost: Int) -> Int {
    return mealCost / 10
}

let serviceChargeAmount = serviceCharge(mealCost: 50)
print (serviceChargeAmount)

func calculateMonthlyPyaments(carPrice: Double, downPayment: Double, interestRate: Double, paymentTerm: Double) -> Double {
    func loanAmount() -> Double {
        return carPrice - downPayment
    }
    
    func totalInterest() -> Double {
        return interestRate * paymentTerm
    }
    
    func numberOfMonths() -> Double {
        return paymentTerm * 12
    }
    
    return ( (loanAmount() + ( loanAmount() * totalInterest()  / 100)) / numberOfMonths())
}

calculateMonthlyPyaments(carPrice: 50000, downPayment: 5000, interestRate: 3.5, paymentTerm: 7.0)

//functions as return types
func makePi() -> (() -> Double) {
    func generatePi() -> Double {
        return 22.0 / 7.0
    }
    return generatePi
}

//let pi = makePi()
//print(pi())


//using functions as parameters

func isThereAMatch(listofNumbers: [Int], condition: (Int) -> Bool) -> Bool {
    for item in listofNumbers {
        if condition(item) {
            return true
        }
    }
    
    return false
}

func oddNumber(number: Int) -> Bool {
    return (number % 2) > 0
}

let numbersList = [2,4,6,7]
isThereAMatch(listofNumbers: numbersList, condition: oddNumber(number:))

func buySomething(itemValueEntered itemValueField: String, cardBalance: Int) -> Int {
    guard let itemValue = Int(itemValueField) else {
        print("Error in item value")
        return cardBalance
    }
    let remainingBalance = cardBalance - itemValue
    return remainingBalance
}

print(buySomething(itemValueEntered: "10", cardBalance: 50))
print(buySomething(itemValueEntered: "blue", cardBalance: 50))


//Closures

var numbersArray = [2, 4, 6, 7]
let myClosure = { (number: Int) -> Int in
    let result = number * number
    return result
    
}

let mappedNumbers = numbersArray.map(myClosure)

var testNumbers = [2, 4, 6, 7]
let mappedTestNumbers = testNumbers.map { $0 * $0 }
print(mappedTestNumbers)

//-------Classes, Structures, and Enumerations------------------//

class Animal {
    var name: String
    var sound: String
    var numberOfLegs: Int
    var breathesOxygen: Bool
    
    init(name: String, sound: String, numberOfLegs: Int, breathesOxygen: Bool) {
        self.name = name
        self.sound = sound
        self.numberOfLegs = numberOfLegs
        self.breathesOxygen = breathesOxygen
    }
    
    func makeSound() {
        print(self.sound)
    }
    
    func description() -> String {
        return "name: \(self.name) sound: \(self.sound) numberOfLegs: \(self.numberOfLegs) breathesOxygen: \(self.breathesOxygen) "
    }
    
}

//creating a subclass of Animal
class Mammal: Animal {
    let hasFurOrHair: Bool = true
    
    override func description() -> String {
        return super.description() + " hasFurOrHair: \(self.hasFurOrHair)"
    }
}

let cat = Mammal(name: "Cat", sound: "Mew", numberOfLegs: 4, breathesOxygen: true)
print(cat.description())
cat.makeSound()

struct Reptile {
    
    var name: String
    var sound: String
    var numberOfLegs: Int
    var breathesOxygen: Bool
    let hasFurOrHair: Bool = false
    
    func makeSound() {
        print(sound)
    }
    
    func description() -> String {
        return "Structure: Reptile name: \(self.name) sound: \(self.sound) numberOfLegs: \(self.numberOfLegs) breathesOxygen: \(self.breathesOxygen) HasFurOrHair: \(self.hasFurOrHair)"
    }
}

var snake = Reptile(name: "Snake", sound: "hiss", numberOfLegs: 0, breathesOxygen: true)

print(snake.description())

snake.makeSound()


struct SampleValueType {
    var sampleProperty = 10
}

var a = SampleValueType()
var b = a
b.sampleProperty = 20
print(a.sampleProperty)
print(b.sampleProperty)

class SampleReferenceType {
    
    var sampleProperty = 10
}

var c = SampleReferenceType()
var d = c
c.sampleProperty = 20
print(c.sampleProperty)
print(d.sampleProperty)

enum TrafficLightColor {
    case Red
    case Yellow
    case Green
    
    func description() -> String {
        switch self {
        case .Red:
            return "Red"
        case .Yellow:
            return "Yellow"
        default:
            return "Green"
        }
    }
    
}

//var trafficLightColor = TrafficLightColor.Red
//print(trafficLightColor.description())

//------------Protocols, Extensions, and Error Handling-----------------//

protocol CalorieCount {
    var calories: Int { get }
    func description() -> String
}

class Burger: CalorieCount {
    let calories = 800
    func description() -> String {
        return "This burger has \(calories) calories"
    }
}


struct Fries: CalorieCount {
    let calories = 500
    func description() -> String {
        return "These fries have \(calories) calories"
    }
}

enum Sauce {
    case chili
    case tomato
}

extension Sauce: CalorieCount {
    var calories: Int {
        switch self {
        case .chili:
            return 20
        case .tomato:
            return 15
            
        }
    }
    
    func description() -> String {
        return "This sauce has \(calories) calories"
    }
}


let burger = Burger()
let fries = Fries()
let sauce = Sauce.tomato
let foodArray: [CalorieCount] = [burger, fries, sauce]

var totalCalories = 0
for food in foodArray  {
    totalCalories += food.calories
}

print(totalCalories)

enum WebsiteError: Erorr {
    case noInternetconnection
    case siteDown
    case wrongURL
}

func checkWebsite(siteUp: Bool) throws -> String {
    if siteUp == false {
        throw WebsiteError.siteDown
    }
    return "Site is up"
}

let siteStatus = false
do {
    print(try checkWebsite(siteUp: siteStatus))
} catch {
    print(error )
}
