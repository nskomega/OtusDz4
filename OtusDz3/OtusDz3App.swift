//
//  OtusDz3App.swift
//  OtusDz3
//
//  Created by Mikhail Danilov on 01.03.2022.
//

import SwiftUI

@main
struct OtusDz3App: App {

    init() {
        Configurator.shared.register()
    }

    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
