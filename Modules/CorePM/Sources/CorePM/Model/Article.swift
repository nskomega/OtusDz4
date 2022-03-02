//
//  File.swift
//  
//
//  Created by Mikhail Danilov on 01.03.2022.
//

import Foundation

@available(iOS 13.0, *)
fileprivate let relativeDateFormatter = RelativeDateTimeFormatter()

public struct Article {

    public let id = UUID()

    public let source: Source
    public let title: String
    public let url: String
    public let publishedAt: Date

    public let author: String?
    public let description: String?
    public let urlToImage: String?


    enum CodingKeys: String, CodingKey {
        case source
        case title
        case url
        case publishedAt
        case author
        case description
        case urlToImage
    }

    public var authorText: String {
        author ?? ""
    }

    public var descriptionText: String {
        description ?? ""
    }

    @available(iOS 13.0, *)
    public var captionText: String {
        "\(source.name) ‧ \(relativeDateFormatter.localizedString(for: publishedAt, relativeTo: Date()))"
    }

    public var articleURL: URL {
        URL(string: url)!
    }

    public var imageURL: URL? {
        guard let urlToImage = urlToImage else {
            return nil
        }
        return URL(string: urlToImage)
    }

}

extension Article: Codable {}
extension Article: Equatable {}
extension Article: Identifiable {}

@available(iOS 10.0, *)
extension Article {

    public static var previewData: [Article] {
        let previewDataURL = Bundle.main.url(forResource: "news", withExtension: "json")!
        let data = try! Data(contentsOf: previewDataURL)

        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601

        let apiResponse = try! jsonDecoder.decode(NewsAPIResponse.self, from: data)
        return apiResponse.articles ?? []
    }

}


public struct Source {
    let name: String
}

extension Source: Codable {}
extension Source: Equatable {}
