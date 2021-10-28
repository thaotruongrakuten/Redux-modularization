//
//  Reducer.swift
//  ReduxModularizationPOC
//
//  Created by Truong, Thao | LTPD on 2021/10/27.
//

import Foundation
import ReSwift
import Counter
import Room
import Contract

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        counterState: counterReducer(action: action, state: state?.counterState),
        roomState: roomReducer(action: action, state: state?.roomState)
    )
}
