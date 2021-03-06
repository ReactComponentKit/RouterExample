//
//  RouterExampleApp.swift
//  RouterExample
//
//  Created by burt on 2021/03/05.
//

import SwiftUI
import Router
import Defaults

@main
struct RouterExampleApp: App {
    
    @Default(.isFirstLaunch)
    var isFirstLaunch
    
    var body: some Scene {
        WindowGroup {
            RouterRootView { router in
                Switch(isFirstLaunch)
                    .Case(true) { _ in
                        OnboardingView()
                    }
                    .Case(false) { _ in
                        ContentView()
                    }
                    .Else {
                        EmptyView()
                    }
                    .navigationBarHidden(true)
            }
            .path("myapp://onboarding") { data in
                Switch(data.page.flatMap { Int($0) })
                    .Case(1) { _ in
                        OnboardingView()
                    }
                    .Case(2) { _ in
                        OnboardingView2()
                    }
                    .Else {
                        EmptyView()
                    }
                    .navigationBarHidden(true)
            }
            .path("myapp://content") { data in
                Switch(data.as_root.flatMap { Bool($0) })
                    .Case(true) { _ in
                        ContentView()
                            .asRouterRootView()
                    }
                    .Else {
                        ContentView()
                    }
                    .navigationBarHidden(true)
            }
            .path("myapp://counter") { data in
                CounterView(count: data.bindings.count)
                    .navigationBarHidden(true)
            }
            .path("myapp://color") { data in
                If(data.color).Let { color in
                    ColorView(color:  MyColor.from(string: color))
                }
                .navigationBarHidden(true)
//                Switch(data.color)
//                    .Case("red") { color in
//                        ColorView(color:  MyColor.from(string: color))
//                            .navigationBarHidden(true)
//                    }
//                    .Case("green") { color in
//                        ColorView(color:  MyColor.from(string: color))
//                            .navigationBarHidden(true)
//                    }
//                    .Else {
//                        Text("OMG")
//                    }
            }
        }
    }
}
