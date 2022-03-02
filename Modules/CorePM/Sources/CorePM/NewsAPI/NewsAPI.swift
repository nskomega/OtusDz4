//
//  File.swift
//  
//
//  Created by Mikhail Danilov on 01.03.2022.
//

import Foundation

@available(iOS 13.0.0, *)
public class NewsAPI {

    public static let shared = NewsAPI()
    public init() {}

    private let apiKey = "8da10975d3154f2cb680b4fcb253d510"
    private let session = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()

    @available(iOS 15.0, *)
    public func fetchArticles(from url: URL) async throws -> [Article] {
        let (data, response) = try await session.data(from: url)

        guard let response = response as? HTTPURLResponse else {
            throw generateError(description: "Bad Response")
        }

        switch response.statusCode {

        case (200...299), (400...499):
            let apiResponse = try jsonDecoder.decode(NewsAPIResponse.self, from: data)
            if apiResponse.status == "ok" {
                return apiResponse.articles ?? []
            } else {
                let errorCode = response.statusCode == 401 ? 401 : 1
                throw generateError(code: errorCode, description: apiResponse.message ?? "An error occured")
            }
        default:
            throw generateError(description: "A server error occured")
        }
    }

    public func generateError(code: Int = 1, description: String) -> Error {
        NSError(domain: "NewsAPI", code: code, userInfo: [NSLocalizedDescriptionKey: description])
    }

    public func generateSearchURL(from query: String) -> URL {
        let percentEncodedString = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        var url = "https://newsapi.org/v2/everything?"
        url += "apiKey=\(apiKey)"
        url += "&language=en"
        url += "&q=\(percentEncodedString)"
        return URL(string: url)!
    }
}
