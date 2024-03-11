import UIKit

protocol Animal {
    func bed()
}
protocol PetsCanFly : Animal {
    func caged()
}
protocol PetsCanSwim : Animal {
    func tank()
}
protocol PetsCanWalk : Animal {
    func exercise()
}
protocol TanksAndCages {
    func cleaned()
}

class Bird : PetsCanFly{
    func caged() {
        print("Đây là bird")
    }
    
    func bed() {
        print("Đã cho bird ăn")
    }
}
class Dog : PetsCanWalk {
    func exercise() {
        print("Đây là Dog")
    }
    
    func bed() {
        print("Đã cho Dog ăn")
    }
}
class Fish : PetsCanSwim {
    func tank() {
        print("Đây là Fish")
    }
    
    func bed() {
        print("Đã cho Fish ăn")
    }
}
var list : [Animal] = []
var dogs = Dog(); var fish = Fish(); var bird = Bird();
list.append(fish)
list.append(dogs)
list.append(bird)
for item in list {
    if let i = item as? PetsCanWalk {
        i.exercise()
    }
    else if let i = item as? PetsCanFly {
        i.caged()
    }
    else if let i = item as? PetsCanSwim {
        i.tank()
    }
}
