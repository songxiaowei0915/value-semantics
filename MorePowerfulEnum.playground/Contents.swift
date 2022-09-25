import Foundation

enum HTTPAction {
    case get
    case post(String)
    case delete(Int, String)
}

var action1 = HTTPAction.get
var action2 = HTTPAction.post("BOXUE")

switch action1 {
case .get:
    print("HTTP GET")
case let .post(message):
    print(message)
case .delete(let id, let data):
    print("id = \(id), data = \(data)")
}

enum List {
    case end
    indirect case node(Int, next:List)
}

let end = List.end
let list1 = List.node(1, next: end)
let list2 = List.node(2, next: end)

enum Direction: Int {
    case east = 1
    case south = 2
    case west = 3
    case north = 4
}

let NORTH = Direction.north

switch NORTH {
case .north, .south:
    print("up and down")
case .east, .west:
    print("right and left")
}

enum Months: Int {
    case january = 1, febrary, march,
    april, may, june, july, august, september,
    october, november, decemeber
}

let JAN = Months.january
type(of: JAN)
print(JAN)
 


