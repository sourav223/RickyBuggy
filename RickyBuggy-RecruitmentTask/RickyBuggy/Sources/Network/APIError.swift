//
//  APIError.swift
//  RickyBuggy
//

import Foundation

enum APIError: Error {
    case imageDataRequestFailed
    case charactersRequestFailed
    case characterDetailRequestFailed
    case locationRequestFailed
    case hostNameNotFound
    case genericError // Added for any other error
}

extension APIError: LocalizedError {
    var errorDescription: String? { // Changed to errorDescription
        switch self {
        case .imageDataRequestFailed:
            return "Could not download image."
        case .charactersRequestFailed:
            return "Could not fetch characters."
        case .characterDetailRequestFailed:
            return "Could not get details of character."
        case .locationRequestFailed:
            return "Could not get details of location."
        case .hostNameNotFound:
            return "A server with the specified hostname could not be found."
        case .genericError:
            return "An error occurred"
        }
    }
}
