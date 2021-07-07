//
//  NetworkManager.swift
//  TeamWork-Location
//
//  Created by Tiko on 07.07.21.
//

import Foundation

protocol NetworkManagerProtocl: AnyObject {
    func get<T: Codable>(with url: String, completion: @escaping ((Result<T, Error>) -> Void))
}

final class NetworkManager: NetworkManagerProtocl {
    
    func get<T: Codable>(with url: String, completion: @escaping ((Result<T, Error>) -> Void)) {
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
