//
//  StockViewModel.swift
//  MvvmStockSwiftui
//
//  Created by usr on 2021/9/3.
//

import Foundation

/// 單一公司股票的 ViewModel
struct StockViewModel {
    let stock: Stock
    
    var symbol: String {
        return self.stock.symbol.uppercased()
    }
    
    var description: String {
        return self.stock.description
    }
    
    var price: String {
        return String(format: "%.2f", self.stock.price)
    }
    
    var change: String {
        return self.stock.change
    }
}
