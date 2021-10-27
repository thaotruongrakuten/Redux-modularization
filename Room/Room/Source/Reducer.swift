//
//  Reducer.swift
//  Room
//
//  Created by Truong, Thao | LTPD on 2021/10/27.
//

import Foundation
import ReSwift
import Contract

public func roomReducer(action: Action, state: RoomState?) -> RoomState {
    var state = state ?? RoomState()

    switch action {
    case _ as RoomActionOpen:
        state.isOpenning = true
    case _ as RoomActionClose:
        state.isOpenning = false
    default:
        break
    }

    return state
}
