//
//  ArticleListView.swift
//  OtusDz3
//
//  Created by Mikhail Danilov on 01.03.2022.
//

import SwiftUI
import CorePM

struct ArticleListView: View {

    let articles: [Article]
    @ObservedObject var model = ArticleViewModel()
    @State var listViewTypeChoice = 0
    var listTypes = ["Tesla", "Top News"]
    @State private var selectedArticle: Article?

    var body: some View {
        VStack {
                List {
                    ForEach(articles) { article in
                        ArticleRowView(article: article)
                            .onTapGesture {
                                selectedArticle = article
                            }
                    }
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowSeparator(.hidden)
                }.animation(.easeInOut)
                .listStyle(.plain)
                .sheet(item: $selectedArticle) {
                    SafariView(url: $0.articleURL)
                        .edgesIgnoringSafeArea(.bottom)
                }.task {
                    await self.model.doSomeAction()
                }
        }
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ArticleListView(articles: Article.previewData)
        }
    }
}

