//
//  FunnyModifier.swift
//  FunnyButton_SwiftUI
//
//  Created by aa on 2023/1/18.
//

import SwiftUI

public struct FunnyModifier: ViewModifier {
    @EnvironmentObject var funny: Funny
    
    var getActions: () -> [FunnyAction]
    
    public func body(content: Content) -> some View {
        content
#if DEBUG
            .onAppear() {
                funny.getActions = getActions
            }
            .onDisappear() {
                funny.getActions = nil
            }
#endif
    }
}

public extension View {
    func funnyAction(_ work: @escaping () -> ()) -> some View {
        modifier(
            FunnyModifier() {
                [FunnyAction(work: work)]
            }
        )
    }
    
    func funnyActions(_ getActions: @escaping () -> [FunnyAction]) -> some View {
        modifier(
            FunnyModifier(getActions: getActions)
        )
    }
}
