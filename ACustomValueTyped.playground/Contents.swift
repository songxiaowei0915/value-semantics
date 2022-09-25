import Foundation

struct Point {
    var x: Double
    var y: Double
    
    init(x: Double = 0, y: Double = 0) {
        self.x = x
        self.y = y
    }
    
    init(_ pt: (Double, Double)) {
        self.x = pt.0
        self.y = pt.1
    }
    
    static let origin = Point((0,0))
}

var pointA = Point(x: 100, y: 200)
let orgin = Point.origin
var pointB = Point((200,200))

var pointC = Point(x: 100, y: 100) {
    didSet {
        print("print changed: \(pointC)")
    }
}

pointC = pointB

pointC.x += 100

extension Point {
    func distantce(to: Point) -> Double {
        let distX = self.x * self.x
        let distY = self.y * self.y
        
        return sqrt(distX * distX + distY * distY)
    }
    
    mutating func move(to: Point) {
        self = to
    }
}
print(pointC.distantce(to: Point.origin))
pointC.move(to: pointA)
