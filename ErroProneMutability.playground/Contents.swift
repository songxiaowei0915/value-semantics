import Foundation

var numbers: Array = [1, 2, 3, 4, 5]

print(numbers)

for _ in numbers {
    numbers.removeLast()
}

print(numbers)

var numberIter = numbers.makeIterator()

while let number = numberIter.next() {
    numbers.removeLast()
}

class Queue {
    var position = 0
    var array: [Int] = []
    
    init(_ array: [Int]) {
        self.array = array
    }
    
    func next() -> Int? {
        guard position < array.count else {
            return nil
        }
        
        position += 1
        
        return array[position-1]
    }
}

func traverseQueue(_ queue: Queue) {
    while let item = queue.next() {
        print(item)
    }
}

let q = Queue([1, 2, 3, 4, 5])
traverseQueue(q)

//for _ in 0 ... 1000 {
//    let q = Queue([1, 2, 3, 4, 5])
//    DispatchQueue.global().async {
//        traverseQueue(q)
//    }
//    traverseQueue(q)
//}
