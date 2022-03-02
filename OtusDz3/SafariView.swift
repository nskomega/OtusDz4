//
//  File.swift
//  
//
//  Created by Mikhail Danilov on 01.03.2022.
//

import SwiftUI
import SafariServices

@available(iOS 13.0.0, *)
public struct SafariView: UIViewControllerRepresentable {

    public let url: URL

    public func makeUIViewController(context: Context) -> some SFSafariViewController {
        SFSafariViewController(url: url)
    }

    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

}

