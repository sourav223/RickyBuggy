//
//  SortMethod.swift
//  RickyBuggy
//

enum SortMethod: Int {
    case name
    case episodesCount
}

extension SortMethod: CustomStringConvertible {
    var description: String {
        switch self {
        case .name:
            return "Name"
        case .episodesCount:
            return "Episodes Count"
        }
    }
}

struct Character {
    let name: String
    let episodesCount: Int
}

func sortCharacters(characters: [Character], sortMethod: SortMethod) -> [Character] {
    switch sortMethod {
    case .name:
        return characters.sorted { $0.name < $1.name }
    case .episodesCount:
        return characters.sorted { $0.episodesCount < $1.episodesCount }
    }
}
