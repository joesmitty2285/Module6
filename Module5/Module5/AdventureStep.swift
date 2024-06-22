// AdventureStep.swift

import Foundation

struct AdventureStep {
    let description: String
    let choices: [Choice]
    
    struct Choice {
        let text: String
        let destination: AdventureStep?
    }
}

