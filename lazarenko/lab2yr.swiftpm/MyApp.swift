import Foundation
// MARK: - 5. JobPosition Enumeration
enum JobPosition: String {
    case developer = "Developer"
    case designer = "Designer"
    case manager = "Manager"
}
// MARK: - 3. Address Structure
struct Address {
    var street: String
    var city: String
    var zipCode: Int? // Optional zip code
    
    // Method to format and return address information
    func fullAddress() -> String {
        if let zip = zipCode {
            return "\(street), \(city), ZIP: \(zip)"
        } else {
            return "\(street), \(city) (ZIP not provided)"
        }
    }
}
// MARK: - 1. Person Class
class Person {
    var firstName: String
    var lastName: String? // Optional last name
    var age: Int?         // Optional age
    
    // Initializer
    init(firstName: String, lastName: String? = nil, age: Int? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    // Function/Method to print full information
    func displayInfo() {
        let fullName = "\(firstName) \(lastName ?? "")".trimmingCharacters(in: .whitespaces)
        let ageText = age != nil ? "\(age!) years old" : "age unknown"
        print("Person: \(fullName), \(ageText)")
    }
    
    // 2. Class method to greet the person
    func greet() {
        var greeting = "Hello, \(firstName)!"
        
        if let lastName = lastName {
            greeting += " Mr./Ms. \(lastName)."
        }
        
        if let age = age {
            greeting += " You are \(age) years old."
        } else {
            greeting += " Your age is unknown to us."
        }
        
        print(greeting)
    }
}
// MARK: - 2. External greetPerson Function
func greetPerson(person: Person) {
    let lastNameInfo = person.lastName != nil ? " \(person.lastName!)" : ""
    let ageInfo = person.age != nil ? " (\(person.age!) y.o.)" : " (age not specified)"
    print("Welcome, \(person.firstName)\(lastNameInfo)\(ageInfo)!")
}
// MARK: - 4. Employee Class (Inherits from Person)
class Employee: Person {
    var position: JobPosition
    var address: Address
    
    // Initializer calling super.init
    init(firstName: String, lastName: String? = nil, age: Int? = nil, position: JobPosition, address: Address) {
        self.position = position
        self.address = address
        super.init(firstName: firstName, lastName: lastName, age: age)
    }
    
    // Override displayInfo method
    override func displayInfo() {
        super.displayInfo()
        print("Position: \(position.rawValue)")
        print("Address: \(address.fullAddress())")
    }
}
// ==========================================
// MARK: - TESTING AND DEMONSTRATION
// ==========================================
print("--- 1. Testing Person with all values provided ---")
let person1 = Person(firstName: "Alex", lastName: "Smith", age: 25)
person1.displayInfo()
person1.greet()
greetPerson(person: person1)
print("\n--- 2. Testing Person with optional nil values ---")
let person2 = Person(firstName: "Maria") // lastName and age are nil
person2.displayInfo()
person2.greet()
greetPerson(person: person2)
print("\n--- 3. Testing Employee and Address ---")
let devAddress = Address(street: "100 Main St", city: "New York", zipCode: 10001)
let employee1 = Employee(
    firstName: "John",
    lastName: "Doe",
    age: 30,
    position: .developer,
    address: devAddress
)
employee1.displayInfo()
print("\n--- 4. Testing Employee with nil ZIP code ---")
let designerAddress = Address(street: "50 Market St", city: "San Francisco", zipCode: nil)
let employee2 = Employee(
    firstName: "Anna",
    position: .designer,
    address: designerAddress
)
employee2.displayInfo()
