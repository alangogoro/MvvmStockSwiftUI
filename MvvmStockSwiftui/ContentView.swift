//
//  ContentView.swift
//  MvvmStockSwiftui
//
//  Created by usr on 2021/9/3.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListViewModel = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        
        stockListViewModel.loadStocksData()
    }
    
    var body: some View {
        
        let filteredStocks = stockListViewModel.seatchTerm.isEmpty ?
            stockListViewModel.stockViewModels : stockListViewModel.stockViewModels.filter { $0.symbol.starts(with: stockListViewModel.seatchTerm) }
        
        return NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                
                Text("September 3 2021")
                    .font(.custom("Arial",
                                  size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0,
                                        leading: 20,
                                        bottom: 0,
                                        trailing: 0))
                    .offset(y: -250)
                
                SearchView(searchTerm: $stockListViewModel.seatchTerm)
                    .offset(y: -200)
                
                StockListView(stocks: filteredStocks)
                    .offset(y: 130)
            }
            .navigationTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
