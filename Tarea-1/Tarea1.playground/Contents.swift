import UIKit
var str = "Hello, playground"

class Dog {
    var name:String
    var color:String
    var ager:Int
    
    init(name:String,color:String,ager:Int) {
        self.name = name
        self.color = color
        self.ager = ager
    }
}


class Person {
    var name:String
    var identifier:String
    var age:Int
    var dogs:[Dog]
    init(name:String,identifier:String,age:Int,dogs:[Dog]) {
        self.name = name
        self.identifier = identifier
        self.age = age
        self.dogs = dogs
    }
}


func PersonPrint(){
    let  person1 = Person(name: "David",identifier: "121231",age: 23,dogs: [Dog(name: "Pupper", color: "white", ager: 2),
                                                                            Dog(name: "Dogger", color: "Brown", ager: 5)])
    let  person2 = Person(name: "Keylor",identifier: "231231",age: 19,dogs: [Dog(name: "Gabe", color: "white", ager: 10),
                                                                             Dog(name: "Julian", color: "Brown", ager: 8)])
    let  person3 = Person(name: "Silvia",identifier: "131313",age: 25,dogs: [Dog(name: "Blanquita", color: "Black", ager: 3),
                                                                             Dog(name: "Camila", color: "White/Black", ager: 8)])
    
    let personList = [person1,person2,person3]
    
    for (index, value) in personList.enumerated(){
        print("Nombre:\(value.name),Edad:\(value.age),Cedula:\(value.identifier)")
        for (dogIndex, dogValue) in value.dogs.enumerated(){
            print("Perro: \(dogIndex)")
            print("Nombre:\(dogValue.name),Edad:\(dogValue.ager),Color:\(dogValue.color)")
        }
        print("\n")
    }
}

//PersonPrint()


func encontrarPrimos(num:Int) -> [Int]?{
    var listPrimes : [Int] = []
    for index in 1...num {
        if index > 1 && !(2..<index).contains { index % $0 == 0 } {
            listPrimes.append(index)
        }
    }
    return listPrimes
}
encontrarPrimos(num:7)


func ordenarNumberos(lista1: [Int],lista2: [Int]) -> [Int]?{
    var newList = lista1 + lista2
    return newList.sorted(by: <)
}
ordenarNumberos(lista1: [200,1,2,10,30], lista2: [3,4,40,100]);












