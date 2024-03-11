import UIKit
import Foundation

// Challenge 1: Movie lists
class User {
    var nameUser : String
    var list : [String : List] = [:]
    init(nameUser: String) {
        self.nameUser = nameUser
    }
    func addList(list : [String: List]) {
        self.list = list
    }
}
class List  {
    var name : String = ""
    var arr : [String] = []
    func printAll() -> () {
        print(arr)
    }
    init(name: String, arr: [String]) {
        self.name = name
        self.arr = arr
    }
}
var list = List(name: "key_1",arr: ["film_1", "film_2","film_3"])
var jane = User(nameUser: list.name)
jane.addList(list: [list.name:list])
var john = jane
john.list["key_1"]?.printAll()
jane.list["key_1"]?.printAll()




//Challenge 2: T-shirt store
struct TShirt {
    var size : Int
    var color : String
    var gia : Int
    var image : String
}
struct Address {
    var name : String
    var street : String
    var city : String
    var zipcode : String
}
class UserProduct {
    var name : String
    var email : String
    var shoppingCard : ShoppingCard
    var address : Address
    init(name: String, email: String, shoppingCard : ShoppingCard, address: Address) {
        self.name = name; self.email = email; self.shoppingCard = shoppingCard; self.address = address
    }
}
class ShoppingCard: NSDistantObject {
    var totalCost : Int
    var address : Address
    init(totalCost : Int, address : Address) {
        self.totalCost = totalCost; self.address = address
    }
}
