//
//  SettingsView.swift
//  ChineseCountingApp
//
//  Created by kamila on 28.03.2025.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var gvm: GameViewModel
    @State private var volume: Double = 0.7
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(content: {
                        Text("Volume, current value: \(volume, specifier: "%.2f")")
                        Slider(value: $volume, in: 0...1, step: 0.1)
                            .tint(.black)
                    }, header: {
                        Text("Audio Settings")
                    })
                }
                Button {
                    gvm.gameModel.volume = volume
                } label: {
                    Label("OK", systemImage: "checkmark.diamond.fill")
                }
                .padding()
                .foregroundStyle(.black)
            }
            .navigationTitle("Game Settings")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(GameViewModel())
    }
}
