//
//  Contract.swift
//  Contract
//
//  Created by Truong, Thao | LTPD on 2021/10/27.
//

import Foundation

public struct RoomState {
    public var isOpenning: Bool = false
    
    public init() {}
}

public protocol HasRoom {
    var roomState: RoomState { get }
}

public struct CounterState {
    public var counter: Int = 0

    public init() {}
}

public protocol HasCounter {
    var counterState: CounterState { get }
}
