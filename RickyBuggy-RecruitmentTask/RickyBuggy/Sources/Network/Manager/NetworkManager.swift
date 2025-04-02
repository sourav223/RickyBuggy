//
//  NetworkManager.swift
//  RickyBuggy
//

import Foundation
import Combine

final class NetworkManager: NetworkManagerProtocol {

    static let RANDOM_HOST_NAME_TO_FAIL_REQUEST = "thisshouldfail.com"

    struct RequestProperties {
        var method: String = "GET"
        var httpBody: Data? = nil
        var timeoutInterval: TimeInterval = 5
        var headers: [String: String]? = nil
        var scheme: String = "https" // Default to HTTPS
    }

    func publisher(path: String) -> AnyPublisher<Data, Error> {
            var components = URLComponents()
            components.scheme = "http"
            components.host = Int.random(in: 1...10) > 3 ? "rickandmortyapi.com" : NetworkManager.RANDOM_HOST_NAME_TO_FAIL_REQUEST
            components.path = path

            guard let url = components.url else {
                return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
            }

            let request = URLRequest(url: url, timeoutInterval: 5)

            return URLSession.shared.dataTaskPublisher(for: request)
                .map { (data: Data, response: URLResponse) in data } // Explicitly specify root type
                .mapError { $0 as Error }
                .eraseToAnyPublisher()
        }

        func publisher(fromURLString urlString: String) -> AnyPublisher<Data, Error> {
            return Just(urlString)
                .compactMap(URL.init)
                .setFailureType(to: URLError.self)
                .flatMap(URLSession.shared.dataTaskPublisher(for:))
                .map { (data: Data, response: URLResponse) in data } // Explicitly specify root type
                .mapError { $0 as Error }
                .eraseToAnyPublisher()
        }
}
