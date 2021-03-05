//
//  SheetView.swift
//  RouterExample
//
//  Created by burt on 2021/03/05.
//

import SwiftUI
import Router

struct CounterView: View {
    @Binding
    var count: Int
    
    @Environment(\.routerPresentationMode)
    var routerPresentationMode
    
    var body: some View {
        VStack(spacing: 48) {
            Text("\(count)")
                .font(.title)
     
            HStack(spacing: 48) {
                Button("Decrement") {
                    count -= 1
                }
                
                Button("Increment") {
                    count += 1
                }
            }
            
            Button("Dismiss") {
                routerPresentationMode.dismiss()
            }
        }
    }
}
