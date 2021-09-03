//
//  Stock.swift
//  MvvmStockSwiftui
//
//  Created by usr on 2021/9/3.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
