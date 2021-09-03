//
//  Webservice.swift
//  MvvmStockSwiftui
//
//  Created by usr on 2021/9/3.
//

import Foundation

class Webservice {
    
    func fetchArticles(completion: @escaping (Result<[Article], NetworkError>) -> Void) {
        guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else { fatalError("Article URL is not correct") }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.domainError))
                }
                return
            }
            
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            DispatchQueue.main.async {
                if articles != nil {
                    completion(.success(articles!))
                } else {
                    completion(.failure(.decodingError))
                }
            }
        }
    }
    
    func fetchStocks(completion: @escaping (Result<[Stock], NetworkError>) -> Void) {
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else { fatalError("Stock URL is not correct") }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.domainError))
                }
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            if let stocks = stocks {
                DispatchQueue.main.async {
                    completion(.success(stocks))
                }
            } else {
                DispatchQueue.main.async {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
    
}

enum NetworkError: Error {
    case domainError
    case decodingError
}
