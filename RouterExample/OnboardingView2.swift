//
//  OnboardingView2.swift
//  RouterExample
//
//  Created by burt on 2021/03/05.
//

import Foundation
import SwiftUI
import Router
import Defaults
struct OnboardingView2: View {
    @EnvironmentObject
    var router: Router
    
    @Default(.isFirstLaunch)
    var isFirstLaunch: Bool
    
    var body: some View {
        VStack {
            Text("Onboarding View Page 2")
            Button("Finish") {
                isFirstLaunch = false
                router.route("myapp://content", .replace, animated: false)                
            }
        }
    }
}

