//
//  DemoApp.swift
//  Demo
//
//  Created by aa on 2023/1/19.
//

import SwiftUI
import FunnyButton_SwiftUI

@main
struct DemoApp: App {
    @StateObject var funny = Funny()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(funny)
                .overlay(FunnyView())
        }
    }
}
