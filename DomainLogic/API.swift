//
//  API.swift
//  DomainLogic
//
//  Created by Dave Poirier on 2023-04-27.
//

import Foundation

/// API namespace & common errors
public final class API {
    typealias URLSessionDataAdapter = (URLRequest) async throws -> (Data, URLResponse)

    public enum Errors: Error {
        case invalidUrl
        case unexpectedResponse
    }
}
