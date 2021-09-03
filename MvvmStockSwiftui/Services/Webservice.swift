//
//  Webservice.swift
//  MvvmStockSwiftui
//
//  Created by usr on 2021/9/3.
//

import Foundation

class Webservice {
    
    func fetchStocks(completion: @escaping (Result<[Stock], NetworkError>) -> Void) {
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else { fatalError("Stock URL is not correct") }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            if let stocks = stocks {
                completion(.success(stocks))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
}

enum NetworkError: Error {
    case domainError
    case decodingError
}
