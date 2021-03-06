//
//  OnboardingView.swift
//  RouterExample
//
//  Created by burt on 2021/03/05.
//

import Foundation
import SwiftUI
import Router

struct OnboardingView: View {
    @EnvironmentObject
    var router: Router
    
    var body: some View {
        VStack {
            Text("Onboarding View Page 1")
            Button("Next") {
                router.route("myapp://onboarding?page=2", .push)
            }
        }
    }
}
