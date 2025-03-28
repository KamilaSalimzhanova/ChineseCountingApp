//
//  ChineseCountingAppApp.swift
//  ChineseCountingApp
//
//  Created by kamila on 28.03.2025.
//

import SwiftUI

@main
struct ChineseCountingAppApp: App {
    @StateObject private var gvm: GameViewModel = GameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(gvm)
        }
    }
}
