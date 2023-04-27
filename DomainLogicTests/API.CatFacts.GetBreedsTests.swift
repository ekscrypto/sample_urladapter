//
//  API.CatFacts.GetBreedsTests.swift
//  DomainLogicTests
//
//  Created by Dave Poirier on 2023-04-27.
//

import XCTest
@testable import DomainLogic

final class APICatFactsGetBreedsTests: XCTestCase {

    func testGetBreedsReportsFailureWhenAPIFails() async throws {
        enum Errors: Error {
            case someFailure
        }
        let apiFailure: API.URLSessionDataAdapter = { _ in throw Errors.someFailure }
        let getBreeds = API.CatFacts.GetBreeds(urlSessionDataAdapter: apiFailure)
        await XCTAssertThrowsError(try await getBreeds.query())
    }
    
    private func prepareSuccessResponse() throws -> (Data, URLResponse) {
        let expectedBreeds: [Breed] = SampleData.breeds
        let pagedResponse = API.CatFacts.GetBreeds.PagedResponse(data: expectedBreeds)
        let responseData = try JSONEncoder().encode(pagedResponse)
        let expectedURL = try XCTUnwrap(URL(string: API.CatFacts.GetBreeds.endpoint))
        let httpResponse = try XCTUnwrap(HTTPURLResponse(url: expectedURL, statusCode: 200, httpVersion: "1.2", headerFields: nil))
        return (responseData, httpResponse)
    }
    
    func testGetBreedsReturnsValuesOnAPISuccess() async throws {
        let (responseData, httpResponse) = try prepareSuccessResponse()
        let apiSuccess: API.URLSessionDataAdapter = { _ in (responseData, httpResponse) }
        let getBreeds = API.CatFacts.GetBreeds(urlSessionDataAdapter: apiSuccess)
        let receivedBreeds = try await getBreeds.query()
        XCTAssertEqual(receivedBreeds, SampleData.breeds)
    }
}
