//
//  InjectedWrapper.swift
//  injectedwrapper
//
//  Created by Anna Zharkova on 28.12.2021.
//

import Foundation
import SwiftUI

@propertyWrapper
public struct Injected<T:AnyObject> {

    public init() { }

    public var service: T?
    public weak var serviceManager = ServiceLocator.shared
    
    public var wrappedValue: T? {
        mutating get {
            if service == nil {
                service =  serviceManager?.resolve(type: T.self)
            }
            return service
        }
        mutating set {
            service = newValue
        }
    }
    
    public var projectedValue:Injected<T> {
        get {return self}
        mutating set {self = newValue}
    }
}
