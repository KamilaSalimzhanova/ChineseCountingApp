//
//  SplashScreenView.swift
//  ChineseCountingApp
//
//  Created by kamila on 28.03.2025.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isPresented: Bool
    @State private var opacity = 0.0
    @State private var scale = CGSize(width: 0.5, height: 0.5)
    @State private var moveUp = false
    @State private var angle = 45.0
    @State private var spacing = 5.0
    @EnvironmentObject var vm: ProverViewModel
    var chinese: String {
        vm.proverbModel.proverb
    }
    var english: String {
        vm.proverbModel.translation
    }
    var pinyin: String {
        vm.proverbModel.pinyin
    }
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black.ignoresSafeArea()
                Image("image1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .ignoresSafeArea()
                    .opacity(opacity)
                
                VStack {
                    VStack(spacing: spacing) {
                        Text(chinese).foregroundStyle(.red)
                        Text(pinyin).foregroundStyle(.orange)
                        Text(english).foregroundStyle(.red)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 25).fill(LinearGradient(colors: [.black, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)))
                    .opacity(1)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding()
                    .scaleEffect(scale)
                    .rotation3DEffect(Angle(degrees: angle), axis: (x:1.0, y:0.0, z:0.0))
                    
                    if moveUp {
                        Spacer()
                    }
                }
                
                VStack {
                    Spacer()
                    Button {
                        withAnimation{
                            isPresented.toggle()
                        }
                    } label: {
                        Image("splashimage")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 75)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(.red, lineWidth: 1))
                    }
                }
            }
        }
        .onAppear{
            withAnimation(.linear(duration: 2.5)) {
                opacity = 0.8
                scale = CGSize(width: 1.0, height: 1.0)
                angle = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                withAnimation(.easeIn(duration: 2.5)) {
                    moveUp = true
                    spacing = 50
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView(isPresented: .constant(true)).environmentObject(ProverViewModel())
    }
}
