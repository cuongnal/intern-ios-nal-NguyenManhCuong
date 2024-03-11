import UIKit

// Challenge 1: Initialization order + Challenge 2: Deinitialization order
class A {
    init() {
        print("i'm. <A>")
    }
    deinit{ print("i'm. <A>")}
}
class B : A {
    override init() {
        super.init()
        print("i'm. <B>")
    }
    deinit{print("i'm. <B>")}
}
class C  : B {
    override init() {
        super.init()
        print("i'm. <C>")
    }
    deinit{print("i'm. <C>")}
}
var c : C? = C(); print()
c = nil

//Challenge 4: To subclass or not
// trong trường hợp này. nên tạo 1 lớp subclass StudentAthlete. như vậy sẽ sử dụng lại được các thuộc tính của StudentBaseballPlayer mà không cần viết lại các thuộc tính. điều đó sẽ giúp code gọn hơn
