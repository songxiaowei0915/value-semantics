import Foundation

let numbers1 = [1, 2, 3, 4, 5, 6]
var numbers2 = numbers1

print(MemoryLayout.size(ofValue: numbers1))

struct MyArray {
    var data: NSMutableArray
    
    var dataCOW: NSMutableArray {
        mutating get {
            if !isKnownUniquelyReferenced(&self.data) {
                print("referenceed is not one")
                self.data = data.mutableCopy() as! NSMutableArray
            }
           
           // print("referenceed is one")
            return self.data
        }
    }
    
    init(data: NSMutableArray) {
        self.data = data.mutableCopy() as! NSMutableArray
    }
    
    mutating func append(element: Any) {
        dataCOW.insert(element, at: data.count)
    }
}

var m = MyArray(data: [1, 2, 3])
let n = m
m.append(element: 11)
print(m.data == n.data)

for i in 1 ... 10 {
    m.append(element: i)
}

class Demo1 {}
var nativeClassObj1 = Demo1()
var nativeClassObj2 = nativeClassObj1
print(isKnownUniquelyReferenced(&nativeClassObj1))

final class Box<T> {
    var unbox: T
    
    init(_ unbox: T) {
        self.unbox = unbox
    }
}

var arryObj: NSArray = [1, 2, 3]
print(isKnownUniquelyReferenced(&arryObj))

var boxed = Box(arryObj)
print(isKnownUniquelyReferenced(&arryObj))
print(isKnownUniquelyReferenced(&boxed))

var array: [MyArray] = [MyArray(data: [1, 2, 3])]
array[0].append(element: 4)
var item0 = array[0]
item0.append(element: 4)

var dictionary = ["key": MyArray(data: [1, 2, 3])]
print("----------------")
dictionary["key"]?.append(element: 4)

