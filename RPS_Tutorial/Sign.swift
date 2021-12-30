//
//  SIgn.swift
//  RPS_Tutorial
//
//  Created by amministratore on 01/04/2021.
//

import Foundation
import GameplayKit

let randomNumber = GKRandomDistribution(lowestValue: 0, highestValue: 2)
func randomSign() -> Sign {
    let sign = randomNumber.nextInt()
    if sign == 0 {
        return .rock
    }else if sign == 1 {
        return .paper
    }else {
        return .scissor
    }
}
enum Sign {
    case rock,paper,scissor
    
    var emoji : String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "🤚"
        case .scissor:
            return "✂️"
        }
    }
func takeTurn(_ opponent : Sign) -> GameState {
    switch self {
    case .rock:
        switch opponent {
        case .rock:
            return GameState.draw
        case .paper:
            return GameState.lose
        case .scissor:
            return GameState.win
        }
    case .paper:
        switch opponent {
        case .rock:
            return GameState.win
        case .paper:
            return GameState.draw
        case .scissor:
            return GameState.lose
        }
    case .scissor:
        switch opponent {
        case .rock:
            return GameState.lose
        case .paper:
            return GameState.win
        case .scissor:
            return GameState.draw
        }
      }
    }
  }
