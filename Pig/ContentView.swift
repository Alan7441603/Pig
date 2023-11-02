//
//  ContentView.swift
//  Pig
//
//  Created by Alan Rivera on 10/30/23.
//

import SwiftUI

struct ContentView: View{
    @State var turnScore = 0
    @State var gameScore = 0
    @State var randomValue = 0
    @State var rotation = 0.0
    var body: some View {
        ZStack {
            Color.gray.opacity(0.7).ignoresSafeArea()
            VStack {
                Image("Pig").resizable().frame(width: 150, height: 150)
                customText(text: "Pig")
                customText(text: "Turn Score: \(turnScore)")
                HStack {
                    Button("roll") {
                        chooseRandom(times: 3)
                        withAnimation(.interpolatingSpring(stiffness: 10, damping: 1 )) {
                            rotation += 360
                        }
                    }
                        .buttonStyle(CustomButtonStyle())
                        Button("Hold") {
                        }
                        .buttonStyle(CustomButtonStyle())
                    }
                    customText(text: "Game Score: \(gameScore)")
                    Image("pips \(randomValue)")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .rotationEffect(.degrees(rotation))
                        .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0))
                        .padding(50)
                    Spacer()
                }
            }
        }
        func endTurn() {
            turnScore = 0
            randomValue = 0
        }
        func chooseRandom(times: Int) {
            if times > 0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    endTurn()
                }
            }
            else {
                turnScore += randomValue
            }
        }
    }
    
    struct CustomButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(width: 50)
                .font(Font.custom("Marker Felt", size: 24))
                .padding()
                .background(.red).opacity(configuration.isPressed ? 0.0 : 1.0)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius:10))
        }
    }
    struct customText: View {
        let text: String
        var body: some View {
            Text(text).font(Font.custom("Marker Felt",size:36))
        }
        
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

