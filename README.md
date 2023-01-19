# FunnyButton_SwiftUI

**FunnyButton_SwiftUI** - 全局便捷调试的按钮，是[FunnyButton](https://github.com/Rogue24/FunnyButton)的`SwiftUI`版本，只需在View上添加调试事件，即可随时点击按钮进行调试。

    Feature：
        ✅ 位于Window层级，不会被app内的界面覆盖；
        ✅ 自适应父View区域，自动靠边，适配横竖屏；
        ✅ 可执行单个/多个调试事件；
        ✅ 兼容iPhone&iPad；
        ✅ 仅限DEBUG环境；
        ✅ API简单易用。
    
## Effect
- 单个调试事件

![single_action](https://github.com/Rogue24/JPCover/raw/master/FunnyButton_SwiftUI/single_action.gif)

- 多个调试事件

![multiple_actions](https://github.com/Rogue24/JPCover/raw/master/FunnyButton_SwiftUI/multiple_actions.gif)

## Initialize

建议在main函数中初始化
```swift
import SwiftUI
import FunnyButton_SwiftUI

@main
struct DemoApp: App {
    // 初始化funny对象用于全局状态管理（添加、移除调试事件）
    @StateObject var funny = Funny()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                // 将funny对象从根视图开始注入到环境中，使其子View都能添加/移除调试事件
                .environmentObject(funny)
                // 添加`FunnyButton`的容器视图在最顶部（不会拦截按钮区域以外的手势事件）
                .overlay(FunnyView())
        }
    }
}
```

## API

- 添加单个调试事件
```swift
struct SingleActionView: View {
    var body: some View {
        Text("点击笑脸打印日志")
            .funnyAction { 
                print("tap me")
            }
    }
}
```

- 添加多个调试事件
```swift
struct MultipleActionsView: View {
    var body: some View {
        Text("点击笑脸选择日志打印")
            .funnyActions {[
                FunnyAction(name: "Happy") {
                    print("Happy")
                },
                FunnyAction(name: "New") {
                    print("New")
                },
                FunnyAction(name: "Yeah") {
                    print("Yeah")
                },
            ]}
    }
}
```

`.funnyAction`和`.funnyActions`都是通过`FunnyModifier`实现：调试事件在`onAppear`添加，在`onDisappear`移除。
```swift
public struct FunnyModifier: ViewModifier {
    @EnvironmentObject var funny: Funny
    
    var getActions: () -> [FunnyAction]
    
    public func body(content: Content) -> some View {
        content
            .onAppear() {
                funny.getActions = getActions
            }
            .onDisappear() {
                funny.getActions = nil
            }
    }
}
```

## Custom button UI 

`FunnyButton.swift` - 可改动的UI属性均为静态属性，且有默认实现，如需改动建议启动App时配置。

```swift
public class FunnyButton: UIButton {
    ......
    
    /// 普通状态
    static var normalEmoji = "😛"
    
    /// 点击状态
    static var touchingEmoji = "😝"
    
    /// 毛玻璃样式（nil为无毛玻璃）
    static var effect: UIVisualEffect? = {
        if #available(iOS 13, *) {
            return UIBlurEffect(style: .systemThinMaterial)
        }
        return UIBlurEffect(style: .prominent)
    }()
    
    /// 背景色
    static var bgColor: UIColor? = UIColor(red: 200.0 / 255.0, green: 100.0 / 255.0, blue: 100.0 / 255.0, alpha: 0.2)
    
    /// 初始点（想`靠右/靠下`的话，`x/y`的值就设置大一点，最后会靠在安全区域的边上）
    static var startPoint: CGPoint = CGPoint(x: 600, y: 100)
    
    /// 安全区域的边距
    static var safeMargin: CGFloat = 12
    
    ......
}
```

## Installation

FunnyButton_SwiftUI is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FunnyButton_SwiftUI'
```

## Author

Rogue24, zhoujianping24@hotmail.com

## License

FunnyButton_SwiftUI is available under the MIT license. See the LICENSE file for more info.
