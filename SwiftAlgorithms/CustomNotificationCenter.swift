//
//  CustomNotificationCenter.swift
//  SwiftAlgorithms
//
//  Created by Shelly Gupta on 12/16/21.
//

import Foundation

struct WeakObserver: Hashable {
    weak var object: NSObject?
    
    init(object: NSObject) {
        self.object = object
    }
}

class CustomNotificationCenter {
    static let shared = CustomNotificationCenter()
    typealias notificationCompletion = (Any?) -> Void
    var storedObserver = [String: [WeakObserver: notificationCompletion]]()
    
    private init() {
    }
    
    func addObserver(observer: NSObject, completionHandler: @escaping notificationCompletion, name: String, object: Any?) {
        storedObserver[name, default: [WeakObserver: notificationCompletion]()][WeakObserver(object: observer)] = completionHandler
    }
    
    func post(name: String, notificationInfo: Any?) {
        storedObserver[name]?.values.forEach {
            $0(notificationInfo)
        }
    }
    
    func removeObserver(name: String, observer: NSObject) {
        storedObserver[name]?.removeValue(forKey: WeakObserver(object: observer))
    }

}
