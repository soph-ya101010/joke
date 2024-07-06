//
//  ContentView.swift
//  joke app
//
//  Created by T Krobot on 29/6/24.
//

import SwiftUI

struct ContentView: View {
    
    var jokes = [Joke(setup: "Why couldn't the bicycle stand up?",
                      punchline: "It was two tired!"),
                 Joke(setup:"Why did the chicken cross the road?",
                      punchline:"To get to the other side!"),
                 Joke(setup: "Is the pool safe for diving?",
                      punchline: "It deep ends"),
                 Joke(setup: "Did you hear about the cheese factory that exploded in France?",
                      punchline:"There was nothing left but de Brie"),
                 Joke(setup: "Dad, can you put my shoes on?",
                      punchline: "I don't think they'll fit me"),
                 Joke(setup: "What did the sea say to the seashore?",
                    punchline: "Nothing, it just waved!")]
    
    @State private var showPunchline = false
    @State private var currentJokeIndex = 0
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .onTapGesture{
                    if showPunchline {
                        currentJokeIndex += 1
                        showPunchline = false
                    }
                }
            VStack {
                Text(jokes[currentJokeIndex % jokes.count].setup)
                    .padding()
                
                Button{
                    print("Button tapped!")
                    showPunchline = true
                }label:{
                    Text("What?")
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                }
                .padding()
            
                Text(jokes[currentJokeIndex % jokes.count].punchline)
                    .padding()
                    .opacity(showPunchline ? 1 : 0)
                
                Text("Tap to continue")
                    .italic()
                    .padding()
                    .opacity(showPunchline ? 1 : 0)
            }
        }
    }
}

#Preview {
    ContentView()
}
