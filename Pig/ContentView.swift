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
    var body: some View {
        ZStack {
            Color.gray.opacity(0.7).ignoresSafeArea()
            VStack {
                Image("Pig").resizable().frame(width: 150, height: 150)
                customText(text: "Pig")
                customText(text: "Turn Score: \(turnScore)")
                customText(text: "Game Score: \(gameScore)")
                Spacer()
            }
        }
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
