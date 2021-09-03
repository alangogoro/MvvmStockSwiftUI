//
//  NewsArticleView.swift
//  MvvmStockSwiftui
//
//  Created by usr on 2021/9/3.
//

import SwiftUI

struct NewsArticleView: View {
    
    let newsArticles: [NewsArticleViewModel]
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading) {
            
            VStack(alignment: .leading) {
                Text("Top News")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(2)
                
                Text("from Apple News")
                    .foregroundColor(Color.gray)
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(2)
                
                ScrollView {
                    VStack {
                        ForEach(newsArticles, id: \.title) { article in
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(article.publication)
                                        .foregroundColor(Color.white)
                                        .font(.custom("Arial", size: 22))
                                        .fontWeight(.bold)
                                    
                                    Text(article.title)
                                        .font(.custom("Arial", size: 22))
                                        .foregroundColor(Color.white)
                                }
                                
                                Spacer()
                            }
                            
                        }
                    }.frame(maxWidth: .infinity)
                }
                
            }.frame(width: screenSize.width, height: screenSize.height)
            .background(Color(red: 27/255, green: 28/255, blue: 30/255))
            .cornerRadius(20)
            
        }
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        let article = Article(title: "News Title", imageURL: "https://upload.wikimedia.org/wikipedia/commons/c/c9/Google_logo_%282013-2015%29.svg", publication: "The Journal")
        
        return NewsArticleView(newsArticles: [NewsArticleViewModel(article: article)])
    }
}
