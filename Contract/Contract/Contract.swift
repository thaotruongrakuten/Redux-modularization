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

public struct CounterState {
    public var counter: Int = 0

    public init() {}
}

public struct AppState {
    public let counterState: CounterState
    public let roomState: RoomState

    public init(counterState: CounterState, roomState: RoomState) {
        self.counterState = counterState
        self.roomState = roomState
    }
}
