//
//  SearchView.swift
//  MvvmStockSwiftui
//
//  Created by usr on 2021/9/3.
//

import SwiftUI

struct SearchView: View {
    
    /* ⭐️ @Binding 關鍵字，賦值時資料亦通知父類別 */
    @Binding var searchTerm: String
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
            
            TextField("Search",
                      text: self.$searchTerm)
                .foregroundColor(Color.primary)
                .padding(10)
            
            Spacer()
        }.foregroundColor(.secondary)
        
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .padding(10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        /* ⭐️ 傳入 searchTerm 初始值 */
        SearchView(searchTerm: .constant(""))
    }
}
