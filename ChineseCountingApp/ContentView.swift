//
//  ContentView.swift
//  ChineseCountingApp
//
//  Created by kamila on 28.03.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gvm: GameViewModel 
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Button("7") {
                gvm.playNumber(7)
            }
            Button("30") {
                gvm.playNumber(30)
            }
            Button("74") {
                gvm.playNumber(74)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GameViewModel())
    }
}
