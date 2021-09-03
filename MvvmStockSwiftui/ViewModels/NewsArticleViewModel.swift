//
//  NewsArticleViewModel.swift
//  MvvmStockSwiftui
//
//  Created by usr on 2021/9/3.
//

import Foundation

struct NewsArticleViewModel {
    let article: Article
    
    var imageURL: String {
        return article.imageURL
    }
    
    var title: String {
        return article.title
    }
    
    var publication: String {
        return article.publication.uppercased()
    }
}
