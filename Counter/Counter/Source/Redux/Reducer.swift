//
//  Reducer.swift
//  Counter
//
//  Created by Truong, Thao | LTPD on 2021/10/27.
//

import Foundation
import ReSwift
import Contract

public func counterReducer(action: Action, state: CounterState?) -> CounterState {
    var state = state ?? CounterState()

    switch action {
    case _ as CounterActionIncrease:
        state.counter += 1
    case _ as CounterActionDecrease:
        state.counter -= 1
    default:
        break
    }

    return state
}
