# @ViewBuilder示例

`@ViewBuilder` 是一个非常灵活的语法糖，用的好可以帮你节省很多时间!

## 示例1

```swift

extension View {
    @ViewBuilder
    func defaultListStyle() -> some View {
        if #available(iOS 14, *) {
            listStyle(InsetGroupedListStyle())
        } else {
            listStyle(GroupedListStyle())
        }
    }
}

struct ItemList: View {
    var items: [Item]

    var body: some View {
        List(items) { item in
            ...
        }
        .defaultListStyle()
    }
}
```

## 示例2

```swift
struct ContentView: View {
    var body: some View {
        Group(content: contentBuilder)
    }

    @ViewBuilder
    func contentBuilder() -> some View {
        Text("This is another way to create a Group 👥")
        Text("Just stack the views 🥞")
    }
}
```

## 示例3

```swift
extension View {
    func addRedBGWithRoundCorner() -> some View {
        self
        .background(Color.blue)
        .cornerRadius(15)
    }
}

//调用：
Text("Liaoworking").addRedBGWithRoundCorner()
```

## 示例4

```swift
struct RedBackgroundAndCornerView<Content: View>: View {
    let content: Content
    @State var needHidden: Bool = false
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .background(Color.red)
            .cornerRadius(5)
            .opacity(needHidden ? 0.0 : 1.0)
            .onTapGesture {
                self.needHidden = true
        }
    }
}。

RedBackgroundAndCornerView {
    Text("liaoworking")
    // 如果不使用@ViewBuilder 这里会报错
    // @ViewBuilder使闭包拥有提供多个视图的特性。
    Text("liaoworking")
}

RedBackgroundAndCornerView {
    Image("liaoworking")
}
```