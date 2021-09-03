//
//  Webservice.swift
//  MvvmStockSwiftui
//
//  Created by usr on 2021/9/3.
//

import Foundation

class Webservice {
    
    func fetchStocks(completion: @escaping ([Stock]?) -> Void) {
        guard let url = URL(string: "https://island-bramble.glitch.me/stock") else { fatalError("Stock URL is not correct") }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            stocks == nil ? completion(nil) : completion(stocks )
        }.resume()
    }
    
}
