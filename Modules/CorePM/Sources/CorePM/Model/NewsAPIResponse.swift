//
//  File.swift
//  
//
//  Created by Mikhail Danilov on 01.03.2022.
//

import Foundation

public struct NewsAPIResponse: Decodable {

    public let status: String
    public let totalResults: Int?
    public let articles: [Article]?

    public let code: String?
    public let message: String?
}
