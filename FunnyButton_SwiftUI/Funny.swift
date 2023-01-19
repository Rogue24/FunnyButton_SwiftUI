//
//  Funny.swift
//  FunnyButton_SwiftUI
//
//  Created by aa on 2023/1/18.
//

public class Funny: ObservableObject {
    private var funnyBtn: FunnyButton { .shared }
    
    public init() {}
    
    public var getActions: (() -> [FunnyAction])? {
        set { funnyBtn.getActions = newValue }
        get { funnyBtn.getActions }
    }
}
