//
//  Configurator.swift
//  OtusDz3
//
//  Created by Mikhail Danilov on 01.03.2022.
//

import Foundation
import CorePM

class Configurator {
    static let shared = Configurator()

    func register() {
        ServiceLocator.shared.addServices(service: NewsAPI())
        ServiceLocator.shared.addServices(service: DataStorage())
    }
}
