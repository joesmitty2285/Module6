// AdventureViewModel.swift
import Foundation

class AdventureViewModel: ObservableObject {
    @Published var currentStep: AdventureStep
    
    private let initialStep: AdventureStep
    
    init() {
        let endSuccess = AdventureStep(description: "You find a pot of gold and live happy the rest of your days. You have successfully completed the adventure!", choices: [])
        let endFail1 = AdventureStep(description: "You fell into a hole and perished. Your adventure ended unsuccessfully.", choices: [])
        let endFail2 = AdventureStep(description: "A Giant bear awakes and eats you. Your adventure ended unsuccessfully.", choices: [])
        let endFail3 = AdventureStep(description: "You follow the river and the ground gives out into a sinkhole. Your adventure ended unsuccessfully.", choices: [])
        
        let step3 = AdventureStep(description: "You see a river. Do you want to cross it or follow it?", choices: [
            AdventureStep.Choice(text: "Cross it", destination: endSuccess),
            AdventureStep.Choice(text: "Follow it", destination: endFail3)
        ])
        
        let step2 = AdventureStep(description: "You find a cave. Do you want to enter it or go around it?", choices: [
            AdventureStep.Choice(text: "Enter it", destination: endFail2),
            AdventureStep.Choice(text: "Go around it", destination: step3)
        ])
        
        let step1 = AdventureStep(description: "You are at a crossroad. Do you want to go left or right?", choices: [
            AdventureStep.Choice(text: "Left", destination: step2),
            AdventureStep.Choice(text: "Right", destination: endFail1)
        ])
        
        self.initialStep = step1
        self.currentStep = step1
    }
    
    func choose(choice: AdventureStep.Choice) {
        if let destination = choice.destination {
            self.currentStep = destination
        }
    }
    
    func restart() {
        self.currentStep = initialStep
    }
}
