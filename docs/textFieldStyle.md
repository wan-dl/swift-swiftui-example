# 自定义输入框样式

iOS上，textFieldStyle, 有3种样式: .automation、.plain、.roundedBorder。

当然，您也可以自定义Style。遵行TextFieldStyle协议，重写_body方法即可

```swift
struct InputCustomStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            Text("")
                .padding(.horizontal, 2)
            configuration
                .frame(height: 40)
        }.background(.white)
    }
}
```