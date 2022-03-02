//
//  ArticleViewModel.swift
//  OtusDz3
//
//  Created by Mikhail Danilov on 02.03.2022.
//

import Foundation
import SwiftUI
import CorePM

class ArticleViewModel : ObservableObject {
    @Injected var network: NewsAPI?
    @Injected var dataStorage: DataStorage?
    let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-01-22&sortBy=publishedAt&apiKey=58587502f78f41089799b1b11c6770a8")!



    func doSomeAction() async {
        do {
            try await network?.fetchArticles(from: url)
        } catch {
            print("Что то пошло не так")
        }
        dataStorage?.doSave()
    }
}
