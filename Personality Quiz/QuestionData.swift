//
//  QuestionData.swift
//  Personality Quiz
//
//  Created by Janelle Law on 2017-11-06.
//  Copyright © 2017 Janelle Law. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: animalType
}

enum animalType: Character {
    case tropicalFish = "🐠", octopus = "🐙", dolphin = "🐬", shark = "🦈"
    
    var definition: String {
        switch self {
        
        case .shark:
            return "You are confident, independent and can do anything you put your mind to."
    
        case .dolphin:
            return "You are friendly, laid back and like to cruise through life."
            
        case .tropicalFish:
            return "You are colourful, creative and fun to be around."
            
        case .octopus:
            return "You are curious, intelligent and like to explore the world around you."
        
        }
        
    }
}
