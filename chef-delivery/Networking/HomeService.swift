//
//  HomeService.swift
//  chef-delivery
//
//  Created by Tiago Silva on 05/05/24.
//

import Foundation
import Alamofire

enum RequestError: Error {
    case invalidURL
    case networkRequest(underlyingError: Error)
    case decoding
}

struct HomeService {
    private let baseURL = "https://private-539b9a-chefdelivery12.apiary-mock.com/home"
    
    private func getBaseURL() throws -> URL {
        guard let baseUrl = URL(string: baseURL) else {
            throw RequestError.invalidURL
        }
        return baseUrl
    }
    
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        do {
            var request = URLRequest(url: try getBaseURL())
            request.httpMethod = "GET"
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let stores = try JSONDecoder().decode([StoreType].self, from: data)
            
            return .success(stores)
        } catch {
            guard let urlError = error as? URLError else {
                return .failure(.decoding)
            }
            return .failure(.networkRequest(underlyingError: urlError))
        }
    }
    
    func sendProduct(product: ProductType) async throws -> Result<[String: String], RequestError> {
        do {
            var request = URLRequest(url: try getBaseURL())
            request.httpMethod = "POST"
            request.httpBody = try JSONEncoder().encode(product)
            let (data, _) = try await URLSession.shared.data(for: request)
            guard let messagem = try JSONSerialization.jsonObject(with: data) as? [String: String] else {
                return .failure(.decoding)
            }
            
            return .success(messagem)
        } catch {
            guard let urlError = error as? URLError else {
                return .failure(.decoding)
            }
            return .failure(.networkRequest(underlyingError: urlError))
        }
    }
}
