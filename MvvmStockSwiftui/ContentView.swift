//
//  ContentView.swift
//  MvvmStockSwiftui
//
//  Created by usr on 2021/9/3.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchTerm: String = ""
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
    }
    
    var body: some View {
        NavigationView {
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
                    .offset(y: -350)
                    // .offset(y: -400)
                
                SearchView(searchTerm: $searchTerm)
                    .offset(y: -300)
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
