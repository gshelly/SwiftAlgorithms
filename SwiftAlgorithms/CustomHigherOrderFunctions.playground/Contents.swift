import UIKit

var arr = [1,2,3,4]
print(arr.map({ Double($0 ) }))

extension Array {
    func customMap<T>(_ transform: (Element) -> T) -> [T] {
        var resultedArray = [T]()
        
        self.forEach {
            resultedArray.append(transform($0))
        }
        
        return resultedArray
    }
    
    func customCompactMap<T>(_ transform: (Element) -> T?) -> [T] {
        var resultedArray = [T]()
        
        self.forEach {
            if let notNilValue = transform($0) {
                resultedArray.append(notNilValue)
            }
        }
        
        return resultedArray
    }
    
    func customFilter(_ isIncluded: (Element) -> Bool) -> [Element] {
        var resultedArray = [Element]()
        
        self.forEach { element in
            if isIncluded(element) {
                resultedArray.append(element)
            }
        }
        
        return resultedArray
    }
    
}

//print(arr.customMap({ "\(String(describing: $0))" }))
//print(arr.customCompactMap({ $0 }))
//
print(arr.customFilter({ $0 > 2 }))
