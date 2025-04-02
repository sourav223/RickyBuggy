//
//  AppearanceFrequency.swift
//  RickyBuggy
//

import Foundation


/// Level selected based on number of appearances in the show, if character appeared 10 times or more - it's high, if 3 times or more - its medium, if 1 or lower - it's low
enum AppearanceFrequency: Int {
    case high = 10
    case medium = 3
    case low = 1
}

extension AppearanceFrequency {
    init(count: Int) {
        if count >= 10 {
            self = .high
        } else if count >= 3 {
            self = .medium
        } else {
            self = .low
        }
    }
    
    var popularity: String {
        switch self {
        case .high:
            return "So popular!"
        case .medium:
            return "Kind of popular"
        case .low:
            return "Meh"
        }
    }
}
