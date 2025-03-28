//
//  ContainerView.swift
//  ChineseCountingApp
//
//  Created by kamila on 28.03.2025.
//

import SwiftUI

struct ContainerView: View {
    @State private var isSplashScreenPresented = true
    @EnvironmentObject var vm: ProverViewModel
    @EnvironmentObject var gm: GameViewModel
    var body: some View {
        if isSplashScreenPresented {
            SplashScreenView(isPresented: $isSplashScreenPresented)
                .disabled(!isSplashScreenPresented)
                .onAppear {
                    vm.getRandomQuote()
                }
        } else {
            ContentView()
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView().environmentObject(ProverViewModel()).environmentObject(GameViewModel())
    }
}
