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
            }
            .path("myapp://onboarding1") { _ in
                OnboardingView()
            }
            .path("myapp://onboarding2") { _ in
                OnboardingView2()
            }
            .path("myapp://content") { _ in
                ContentView()
                    .navigationBarHidden(true)
            }
            .path("myapp://content.as.root") { _ in
                ContentView()
                    .navigationBarHidden(true)
                    .asRouterRootView()
            }
            .path("myapp://counter") { data in
                CounterView(count: data.bindings.count)
            }
            .path("myapp://color") { data in
                If<String>(data.color).Let { color in
                    ColorView(color:  MyColor.from(string: color))
                        .navigationBarHidden(true)
                }
//                Switch<String>(data.color)
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
