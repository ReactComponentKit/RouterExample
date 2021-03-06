//
//  RedView.swift
//  RouterExample
//
//  Created by burt on 2021/03/05.
//

import SwiftUI
import Router

enum MyColor: String {
    case red
    case green
    case blue
    case yellow
    case purple
    case white
    
    static func from(string: String) -> MyColor {
        return MyColor(rawValue: string) ?? .white
    }
}

struct ColorView: View {
    @EnvironmentObject
    var router: Router
    
    var color: MyColor = .white
    
    var body: some View {
        VStack(spacing: 48) {
            switch color {
            case .red:
                Button("Go to Green") {
                    router.route("myapp://color?color=green", .push)
                }
            case .green:
                Button("Go to Blue") {
                    router.route("myapp://color?color=blue", .push)
                }
            case .blue:
                Button(action: { router.route("myapp://color?color=yellow", .push) }) {
                    Text("Go to Yellow")
                        .foregroundColor(.white)
                }
            case .yellow:
                Button("Go to Purple") {
                    router.route("myapp://color?color=purple", .push)
                }
            case .purple:
                Button("Go to White") {
                    router.route("myapp://color?color=white", .push)
                }
            default:
                Button("Go to Red") {
                    router.route("myapp://color?color=red", .push)
                }
            }
            
            Button(action: { router.route("myapp://content?as_root=true", .sheet) }) {
                Text("Go to Sheet")
                    .foregroundColor(.black)
            }
                        
            Button(action: { router.popToRoot() }) {
                Text("Pop To Root")
                    .foregroundColor(.black)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(makeColor(color: color).ignoresSafeArea())
    }
    
    private func makeColor(color: MyColor) -> Color {
        switch color {
        case .red:
            return Color.red
        case .blue:
            return Color.blue
        case .green:
            return Color.green
        case .yellow:
            return Color.yellow
        case .purple:
            return Color.purple
        case .white:
            return Color.white
        }
    }
}
