//
//  FunnyContainer.swift
//  FunnyButton_SwiftUI
//
//  Created by aa on 2023/1/17.
//

import UIKit

public class FunnyContainer: UIView {
    private var funnyBtn: FunnyButton { .shared }
    
    init() {
        super.init(frame: .zero)
        
        UIView.funnyHook
        isFunnable = true
        
        addSubview(funnyBtn)
        funnyBtn.updateSafeFrame(UIScreen.main.bounds)
        funnyBtn.moveToBorder(animated: false)
    }
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        guard let superview = superview else { return }
        // superview: _UIConstraintBasedLayoutHostingView
        superview.isFunnable = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        guard funnyBtn.safeFrame != bounds else { return }
        funnyBtn.updateSafeFrame(bounds)
        funnyBtn.moveToBorder(animated: true)
    }
}

private var _isFunnable: CChar = 0
private extension UIView {
    static let funnyHook: Void = { funnyExchangeHitTest() }()
    
    static func funnyExchangeHitTest() {
        guard let originalMethod = class_getInstanceMethod(self, #selector(hitTest(_:with:))),
              let swizzledMethod = class_getInstanceMethod(self, #selector(funny_hitTest(_:with:))) else {
            return
        }
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
    
    var isFunnable: Bool {
        set { objc_setAssociatedObject(self, &_isFunnable, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
        get { objc_getAssociatedObject(self, &_isFunnable) as? Bool ?? false }
    }
    
    @objc func funny_hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard isFunnable else {
            // 自己调用`funny_hitTest` -> 执行【原方法】hitTest
            return funny_hitTest(point, with: event)
        }
        
        // MARK: 拦截点击 => 自己不响应，触碰的子视图响应。
        guard !isHidden, subviews.count > 0 else { return nil }
        for subview in subviews.reversed() where subview.isUserInteractionEnabled && !subview.isHidden && subview.alpha > 0.01 && subview.frame.contains(point) {
            let subPoint = convert(point, to: subview)
            // 其他对象调用`hitTest` -> 执行【交换后的方法】funny_hitTest
            guard let rspView = subview.hitTest(subPoint, with: event) else { continue }
            return rspView
        }
        return nil
    }
}
