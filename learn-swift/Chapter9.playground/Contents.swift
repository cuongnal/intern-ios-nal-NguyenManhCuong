import UIKit


//Challenge 1: Character count
func countChar(_ str : String) -> String {
    var charr = Array(str)
    charr.sort()
    return String(charr)
}
print(countChar("0918736472"))



//Challenge 2: Word count
func countWord(_ str : String) {
    var i = 0
    for _ in str {
        i += 1
    }
    print("độ dài của chuỗi là : \(i)")
}
countWord("sacbdsskkaksdjifjie")


// Challenge 3: Name formatter
func format(_ str : String) {
    let p = str.firstIndex(of: ",")!
    let space  = str.firstIndex(of: " ")!
    let char1 = str[..<p]
    let char2 = str[str.index(after: space)...]
    let a = char2 + " " + char1
    print(a)
}
format("Galloway, Matt")


//Challenge 4: Components
func componentString(_ str: String) {
    var c = str.components(separatedBy: ",")
    print(c)
}
componentString("ksdm, cnabc, acn, cgon")


//Challenge 5: Word reverser
func revert(_ str : String) {
    var str2 = ""
    var cache = ""
    for i in str.indices {
        if str.index(str.startIndex,offsetBy: str.count - 1) == i {
            str2 += String(str[i])
            str2 += cache.reversed() + " "
            break
        }
        if str[i] == " "  {
            str2 += cache.reversed() + " "
            cache = ""
        }
        else {
            cache += String(str[i])
        }
    }
    print(str2)
}
revert("My dog is called Rover")
