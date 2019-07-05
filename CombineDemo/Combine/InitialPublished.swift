//
//  InitialPublished.swift
//  CombineDemo
//
//  Created by Michal Cichecki on 01/07/2019.
//  Copyright © 2019 codeuqest. All rights reserved.
//

import Combine

@propertyWrapper // @propertyDelegate
struct InitialPublished<Value>: Publisher {
    typealias Output = Value
    typealias Failure = Never
    
    private let subject: CurrentValueSubject<Output, Failure>
    
    var wrappedValue: Value {
        get {
            subject.value
        }
        set {
            subject.send(newValue)
        }
    }
    
    init(initialValue: Value) {
        subject = CurrentValueSubject(initialValue)
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Value == S.Input {
        subject.receive(subscriber: subscriber)
    }
}
