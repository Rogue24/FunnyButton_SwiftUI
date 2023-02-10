//
//  DemoModifier.swift
//  Demo
//
//  Created by aa on 2023/2/9.
//

import SwiftUI
import FunnyButton_SwiftUI

struct DemoModifier: ViewModifier {
    let useWay: FunnyUseWay
    
    func body(content: Content) -> some View {
        switch useWay {
        case .SwiftUIView:
            content.overlay(FunnyView())
        case .UIWindow:
            content.onAppear() { FunnyWindow.show() }
        }
    }
}

extension View {
    func funnyUseWay(_ useWay: FunnyUseWay) -> some View {
        modifier(DemoModifier(useWay: useWay))
    }
}
