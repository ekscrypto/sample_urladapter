//
//  API.CatFacts.GetBreeds.SampleResponses.swift
//  DomainLogicTests
//
//  Created by Dave Poirier on 2023-04-27.
//

import Foundation
@testable import DomainLogic

final class SampleData {
    static let breeds: [Breed] = [
        .init(
            breed: "Abyssinian",
            country: "Ethiopia",
            origin: "Natural/Standard",
            coat: "Short",
            pattern: "Ticked"
        ),
        .init(
            breed: "Aegean",
            country: "Greece",
            origin: "Natural/Standard",
            coat: "Semi-long",
            pattern: "Bi- or tri-colored"
        ),
        .init(
            breed: "American Curl",
            country: "United States",
            origin: "Mutation",
            coat: "Short/Long",
            pattern: "All"
        ),
        .init(
            breed: "American Bobtail",
            country: "United States",
            origin: "Mutation",
            coat: "Short/Long",
            pattern: "All"
        )
    ]
}
