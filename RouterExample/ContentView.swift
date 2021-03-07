//
//  ContentView.swift
//  RouterExample
//
//  Created by burt on 2021/03/05.
//

import SwiftUI
import Router
struct ContentView: View {
    @EnvironmentObject
    var router: Router
    
    @State
    var count = 1
        
    var body: some View {
        VStack(spacing: 48) {
            Button("Go to Red") {
                router.route("myapp://color?color=red", .push)
            }
            
            Text("\(count)")
                .font(.title)
            
            Button("Go to Counter Sheet") {
                //router.route("myapp://color?color=red", .sheet)
                router.builder()
                    .route("myapp://counter")
                    .presentation(mode: .sheet)
                    .binding(name: "count", to: $count)
                    .go()
            }
                        
            Button("FormSheet") {
                router.builder()
                    .route("myapp://counter")
                    .presentation(mode: .formSheet)
                    .binding(name: "count", to: $count)
                    .go()
            }
            
            Button("currentContext") {
                router.builder()
                    .route("myapp://counter")
                    .presentation(mode: .currentContext)
                    .transition(style: .crossDissolve)
                    .binding(name: "count", to: $count)
                    .go()
            }
            
            Button("overCurrentContext") {
                router.builder()
                    .route("myapp://counter")
                    .presentation(mode: .overCurrentContext)
                    .transition(style: .crossDissolve)
                    .binding(name: "count", to: $count)
                    .go()
            }
            
            Button("fullscreen") {
                router.builder()
                    .route("myapp://counter")
                    .presentation(mode: .fullscreen)
                    .transition(style: .crossDissolve)
                    .binding(name: "count", to: $count)
                    .go()
            }
            
            Button("overFullscreen") {
                router.builder()
                    .route("myapp://counter")
                    .presentation(mode: .overFullscreen)
                    .transition(style: .crossDissolve)
                    .binding(name: "count", to: $count)
                    .go()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
