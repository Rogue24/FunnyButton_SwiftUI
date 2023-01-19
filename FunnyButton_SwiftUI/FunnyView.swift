//
//  FunnyView.swift
//  FunnyButton_SwiftUI
//
//  Created by aa on 2023/1/16.
//

import SwiftUI

/**
 * 层级结构：
 - FunnyView
    - _UIConstraintBasedLayoutHostingView（私有类）
        - FunnyContainer
            - FunnyButton
 */

/// 遵守 UIViewRepresentable，可以使用UIKit的视图
public struct FunnyView: UIViewRepresentable {
    public init() {}
    
    /// 创建视图
    public func makeUIView(context: Context) -> FunnyContainer {
        FunnyContainer()
    }
    
    /// 刷新视图
    public func updateUIView(_ uiView: FunnyContainer, context: Context) {
        
    }
}
