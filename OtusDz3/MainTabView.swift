//
//  MainTabView.swift
//  OtusDz3
//
//  Created by Mikhail Danilov on 01.03.2022.
//

import SwiftUI
import CorePM

struct MainTabView: View {

    var body: some View {
        TabView() {

            ArticleListView(articles: Article.previewData)
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }.tag(0)
            SecondScreen()
                .tabItem {
                    Label("Second", systemImage: "rectangle.leadinghalf.filled")
                }.tag(2)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
