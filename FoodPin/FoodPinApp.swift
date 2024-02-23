//
//  FoodPinApp.swift
//  FoodPin
//
//  Created by Yerasyl Sharipov on 09.03.2023.
//

import SwiftUI

@main
struct FoodPinApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
        }
    }
}
