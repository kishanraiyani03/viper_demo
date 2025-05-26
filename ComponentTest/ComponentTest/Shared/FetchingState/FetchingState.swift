//
//  FetchingState.swift
//  ComponentTest
//
//  Created by SOTSYS061 on 26/05/25.
//

import Foundation



enum FetchingState {
    case idle
    case loading
}

struct FetchingDataState<T> {
    var state:FetchingState
    var data:T
    
    init(state: FetchingState, data: T) {
        self.state = state
        self.data = data
    }
    
    mutating func update(state:FetchingState, data:T) {
        self.state = state
        self.data = data
    }
    
    mutating func updateState(state:FetchingState) {
        self.state = state
    }
    
    mutating func updateData(data:T) {
        self.data = data
    }
}
