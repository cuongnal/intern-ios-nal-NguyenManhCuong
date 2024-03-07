import UIKit

// Challenge 1: Fruit tree farm
struct ContainerPears {
    var pears : Int = 0
    func tinhToan() {
        print("so pear la: \(pears)")
    }
}
struct ContainerOranges {
    var oranges : Int = 0
    func tinhToan() {
        print("so oranges la: \(oranges)")
    }
}
struct ContainerApples {
    var apples : Int = 0
    func tinhToan() {
        print("so apple la: \(apples)")
    }
}
struct Fruit {
    var pears : Int
    var oranges : Int
    var apples : Int
}
var container = Fruit(pears: 100, oranges: 210 , apples: 40)
var conPears = ContainerPears(pears: container.pears)
var conOranges = ContainerOranges(oranges: container.oranges)
var conAppls = ContainerApples(apples: container.apples)
conPears.tinhToan();conOranges.tinhToan();conAppls.tinhToan()




//Challenge 2: A T-shirt model
struct Tshirt {
    var size : Int
    var color : String
    var material : String
    func tinhToan(gia: Int) -> Int {
        if(material == "da"){
            return gia * 2
        }
        else {
            return gia
        }
    }
}
var tShirt = Tshirt(size: 3, color: "đỏ", material: "da")
print("gia cua ao la :\(tShirt.tinhToan(gia: 1000))")


