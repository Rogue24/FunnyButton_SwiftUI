//
//  ContentView.swift
//  Demo
//
//  Created by aa on 2023/1/19.
//

import SwiftUI

struct ContentView: View {
    let useWay: FunnyUseWay
    
    @State private var isPresent = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: SingleActionView()) {
                        Text(SingleActionView.title)
                    }
                    NavigationLink(destination: MultipleActionsView()) {
                        Text(MultipleActionsView.title)
                    }
                    Button("Present TestView") {
                        isPresent = true
                    }
                }
            }
            .navigationBarTitle("Example")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $isPresent) { PresentTestView(useWay: useWay) }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(useWay: .SwiftUIView)
    }
}
