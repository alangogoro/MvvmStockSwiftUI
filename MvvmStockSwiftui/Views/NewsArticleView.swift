//
//  NewsArticleView.swift
//  MvvmStockSwiftui
//
//  Created by usr on 2021/9/3.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
    
    let newsArticles: [NewsArticleViewModel]
    
    /* DragGesture */
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading) {
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Top News")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(2)
                    
                    Text("from  News")
                        .foregroundColor(Color.gray)
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(2)
                }
                Spacer()
            }.padding().contentShape(Rectangle())
            /* 監測手勢賦值 onDragBegin, onDragEnd 兩個 Callback(回呼)函式 */
            .gesture(DragGesture()
                        .onChanged(onDragBegin)
                        .onEnded(onDragEnd))
                
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
                            
                            URLImage(URL(string: article.imageURL)!) { image in
                                image.resizable()
                            }.frame(width: 100, height: 100)
                        }
                        
                    }
                }.frame(maxWidth: .infinity)
            }
            
        }.frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(20)
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        let article = Article(title: "News Title", imageURL: "https://hotaicdn.azureedge.net/toyotaweb/CMS_2020092716124120010129.jpg", publication: "The Journal")
        
        return NewsArticleView(newsArticles: [NewsArticleViewModel(article: article)],
                               onDragBegin: { _ in },
                               onDragEnd: { _ in })
    }
}
