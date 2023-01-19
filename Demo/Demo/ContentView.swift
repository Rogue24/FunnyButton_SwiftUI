//
//  ContentView.swift
//  Demo
//
//  Created by aa on 2023/1/19.
//

import SwiftUI

struct ContentView: View {
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
                }
            }
            .navigationBarTitle("Example")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
