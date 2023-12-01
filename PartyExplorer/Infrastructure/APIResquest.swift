//
//  APIResquest.swift
//  PartyExplorer
//
//  Created by Ruyther Costa on 2023-12-01.
//

import Foundation

protocol APIResquestProtocol {
    func request<T: Decodable>(fileName: String, type: T.Type) async throws -> [T]
}

final class APIRequest: APIResquestProtocol {
    enum RequestError: Error {
        case fileNotFound
        case decodeError
    }

    func request<T: Decodable>(fileName: String, type: T.Type) async throws -> [T] {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw RequestError.fileNotFound
        }

        let data = try Data(contentsOf: url)
        do {
            let decodedData = try JSONDecoder().decode([T].self, from: data)
            return decodedData
        } catch {
            throw RequestError.decodeError
        }
    }
}
