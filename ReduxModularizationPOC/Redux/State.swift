//
//  State.swift
//  ReduxModularizationPOC
//
//  Created by Truong, Thao | LTPD on 2021/10/27.
//

import Foundation
import Contract

struct AppState {
    let counterState: CounterState
    let roomState: RoomState
}

extension AppState: HasCounter {}
extension AppState: HasRoom {}
