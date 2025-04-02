//
//  NetworkManagerProtocol.swift
//  RickyBuggy
//

import Foundation
import Combine

protocol NetworkManagerProtocol {
    func publisher(path: String) -> AnyPublisher<Data, Error>
    func publisher(fromURLString urlString: String) -> AnyPublisher<Data, Error>
}
