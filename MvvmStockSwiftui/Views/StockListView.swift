//
//  StockListView.swift
//  MvvmStockSwiftui
//
//  Created by usr on 2021/9/3.
//

import SwiftUI

struct StockListView: View {
    
    let stocks: [StockViewModel]
    
    var body: some View {
        List(stocks, id: \.symbol) { stock in
            StockCellView(viewModel: stock)
        }
    }
}

struct StockCellView: View {
    let viewModel: StockViewModel
    
    var body: some View {
        
        return HStack {
            VStack(alignment: .leading) {
                Text(viewModel.symbol)
                    .font(.custom("Arial", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(EdgeInsets(top: 0,
                                        leading: 0,
                                        bottom: 5,
                                        trailing: 0))
                Text(viewModel.description)
                    .font(.custom("Arial", size: 18))
                    .foregroundColor(Color.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(viewModel.price)")
                    .foregroundColor(Color.white)
                    .font(.custom("Arial", size: 22))
                
                Button(viewModel.change) {
                    
                }.frame(width: 75)
                .padding(5)
                .background(Color.red)
                .foregroundColor(Color.white)
                .cornerRadius(6)
            }
        }
        
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let stock = Stock(symbol: "APPL", description: "Apple Stocks", price: 800, change: "+0.00")
        
        return StockListView(stocks: [StockViewModel(stock: stock)])
    }
}
