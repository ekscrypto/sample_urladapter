//
//  API.CatFacts.Breeds.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-27.
//

import Foundation


public extension API.CatFacts {
    
    /// GetBreeds API
    /// Documentation: https://catfact.ninja/#/Breeds/getBreeds
    struct GetBreeds {
        static let endpoint = "https://catfact.ninja/breeds"
        public static func withDefaults() -> GetBreeds {
            GetBreeds(urlSessionDataAdapter: URLSession.shared.data(for:))
        }

        // MARK: -- Inject the closure to use to retrieve the data for URLRequest
        let urlSessionDataAdapter: API.URLSessionDataAdapter

        // MARK: -
        // Paging is not supported in this simplified demo, left as an exercise
        // to the reader
        struct PagedResponse: Codable {
            let data: [Breed]
        }
        
        public func query() async throws -> [Breed] {
            guard let url = URL(string: Self.endpoint) else {
                throw API.Errors.invalidUrl
            }

            let urlRequest = URLRequest(url: url)
            let (data, urlResponse) = try await urlSessionDataAdapter(urlRequest)
            guard let httpResponse = urlResponse as? HTTPURLResponse,
                  httpResponse.statusCode == 200
            else {
                throw API.Errors.unexpectedResponse
            }
            
            let pagedResponse = try JSONDecoder().decode(PagedResponse.self, from: data)
            return pagedResponse.data
        }
    }
}
