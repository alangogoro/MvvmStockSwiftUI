//
//  StockListViewModel.swift
//  MvvmStockSwiftui
//
//  Created by usr on 2021/9/3.
//

import Foundation

/// 全頁股票列表的 ViewModel
class StockListViewModel: ObservableObject {
    /* ⭐️🔰 這是一個 class，並且遵從 ObservableObject 🔰⭐️
     * 可以使用 @Published 關鍵字讓屬性成為可被觀察的序列 */
    
    /* ⭐️ 加上 @Published 變成可被觀察的序列，一旦被"賦值"就發出事件 */
    @Published var stockViewModels: [StockViewModel] = [StockViewModel]()
    @Published var news: [NewsArticleViewModel] = [NewsArticleViewModel]()
    @Published var seatchTerm: String = ""
    
    func loadData() {
        fetchStocks()
        fetchNews()
    }
    
    private func fetchStocks() {
        Webservice().fetchStocks { result in
            switch result {
            case .success(let stocks):
                /* ⭐️ 利用 map 操作 Stock陣列，生成 stockViewModel 物件
                 * 再"賦值"自身屬性的空白陣列，賦值要指定在 主執行緒上面執行，以利 UI 更新 */
                DispatchQueue.main.async {
                    self.stockViewModels = stocks.map(StockViewModel.init)
                }
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    private func fetchNews() {
        Webservice().fetchArticles { result in
            switch result {
            case .success(let articles):
                DispatchQueue.main.async {
                    self.news = articles.map(NewsArticleViewModel.init)
                }
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
}
