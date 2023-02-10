//
//  DemoApp.swift
//  Demo
//
//  Created by aa on 2023/1/19.
//

import SwiftUI
import FunnyButton_SwiftUI

enum FunnyUseWay {
    case SwiftUIView
    case UIWindow
}

@main
struct DemoApp: App {
    let useWay: FunnyUseWay = .UIWindow
    
    @StateObject var funny = Funny()
    
    var body: some Scene {
        WindowGroup {
            ContentView(useWay: useWay)
                .funnyUseWay(useWay)
                .environmentObject(funny)
        }
    }
}
