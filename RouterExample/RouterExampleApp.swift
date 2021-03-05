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
                EmptyView()
                    .onAppear {
                        if isFirstLaunch {
                            router.route("myapp://onboarding1", .replace)
                        } else {
                            router.route("myapp://content", .replace)
                        }
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
                ColorView(color:  MyColor(rawValue: data.color ?? "red") ?? .red)
                    .navigationBarHidden(true)
            }
        }
    }
}
