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
    @StateObject private var pvm: ProverViewModel = ProverViewModel()
    var body: some Scene {
        WindowGroup {
            ContainerView().environmentObject(gvm).environmentObject(pvm)
        }
    }
}
