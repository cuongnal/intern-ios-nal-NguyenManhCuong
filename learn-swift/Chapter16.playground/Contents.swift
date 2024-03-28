import UIKit

func cong(a: Int, b: Int) async -> Int {
    for i in a...b {
        print("đây là cong\(i)")
    }
    return 2
}

func nhan(a: Int, b: Int) async -> Int {
    for i in a...b {
        print("đây là nhan\(i)")
    }
    return 100
}

func tinh() async {
    let A = 1
    let B = 20
    print("... #1")
    let Cong = cong(a: A, b: B)
    print("... #2")
    let Nhan = nhan(a: A, b: B)
    print("2 kết quả nè: \(Cong) & \(Nhan)")
}
async {
    await tinh()
}
