//
//  Breed.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-27.
//

import Foundation

public struct Breed: Identifiable, Codable, Equatable, Sendable {
    public var id: String { breed }
    
    public let breed: String
    public let country: String
    public let origin: String
    public let coat: String
    public let pattern: String
    
    public init(breed: String, country: String, origin: String, coat: String, pattern: String) {
        self.breed = breed
        self.country = country
        self.origin = origin
        self.coat = coat
        self.pattern = pattern
    }
}
