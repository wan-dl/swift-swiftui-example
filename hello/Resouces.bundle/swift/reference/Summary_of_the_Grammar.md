## 词法结构

> 空白字符语法
>
> _空白字符_ → [空白字符项](./02_Lexical_Structure.md#whitespace-item) [空白字符](./02_Lexical_Structure.md#whitespace)<sub>可选</sub>
>
> _空白字符项_ → [换行符](./02_Lexical_Structure.md#line-break)
>
> _空白字符项_ → [注释](./02_Lexical_Structure.md#comment)
>
> _空白字符项_ → [多行注释](./02_Lexical_Structure.md#multiline-comment)
>
> _空白字符项_ → U+0000，U+0009，U+000B，U+000C 或 U+0020
>
> 换行符\* → U+000A
>
> _换行符_ → U+000D
>
> _换行符_ → U+000D 后面是 U+000A
>
> _注释_ → **//** [单行内容注释](./02_Lexical_Structure.md#comment-text) [换行符](./02_Lexical_Structure.md#line-break)
>
> _注释_ → **/\*** [多行内容注释](./02_Lexical_Structure.md#multiline-comment-text) **\*/**
>
> _注释内容_ → [注释内容项](./02_Lexical_Structure.md#comment-text-item) [注释内容](./02_Lexical_Structure.md#comment-text)<sub>可选</sub>
>
> _注释内容项_ → 除 U+000A 或 U+000D 外的任何 Unicode 标量值
>
> _多行注释内容_ → [多行注释内容项](./02_Lexical_Structure.md#multiline-comment-text-item) [多行注释内容](./02_Lexical_Structure.md#multiline-comment-text)<sub>可选</sub>
>
> _多行注释内容项_ → [多行内容](./02_Lexical_Structure.md#multiline-comment)
>
> _多行注释内容项_ → [注释内容项](./02_Lexical_Structure.md#comment-text-item)
>
> _多行注释内容项_ → 除 **/\*** 或 **\*/** 外的任何 Unicode 标量值

<!-- -->

> 标识符语法
>
> _标识符_ → [标识符头（Head）](./02_Lexical_Structure.md#identifier-head) [标识符字符集](./02_Lexical_Structure.md#identifier-characters)<sub>可选</sub>
>
> _标识符_ → [标识符头（Head）](./02_Lexical_Structure.md#identifier-head) [标识符字符集](./02_Lexical_Structure.md#identifier-characters)<sub>可选</sub>
>
> _标识符_ → [隐式参数名](./02_Lexical_Structure.md#implicit-parameter-name)
>
> _标识符_ → [属性包装器呈现值](./02_Lexical_Structure.md#property-wrapper-projection)
>
> _标识符集_ → [标识符](./02_Lexical_Structure.md#identifier) | [标识符](./02_Lexical_Structure.md#identifier) **,** [标识符集](./02_Lexical_Structure.md#identifier-list)
>
> _标识符头（Head）_ → 大写或者小写字母 A 到 Z
>
> _标识符头（Head）_ → \_
>
> _标识符头（Head）_ → U+00A8, U+00AA, U+00AD, U+00AF, U+00B2–U+00B5, or U+00B7–U+00BA
>
> _标识符头（Head）_ → U+00BC–U+00BE, U+00C0–U+00D6, U+00D8–U+00F6, or U+00F8–U+00FF
>
> _标识符头（Head）_ → U+0100–U+02FF, U+0370–U+167F, U+1681–U+180D, or U+180F–U+1DBF
>
> _标识符头（Head）_ → U+1E00–U+1FFF
>
> _标识符头（Head）_ → U+200B–U+200D, U+202A–U+202E, U+203F–U+2040, U+2054, or U+2060–U+206F
>
> _标识符头（Head）_ → U+2070–U+20CF, U+2100–U+218F, U+2460–U+24FF, or U+2776–U+2793
>
> _标识符头（Head）_ → U+2C00–U+2DFF or U+2E80–U+2FFF
>
> _标识符头（Head）_ → U+3004–U+3007, U+3021–U+302F, U+3031–U+303F, or U+3040–U+D7FF
>
> _标识符头（Head）_ → U+F900–U+FD3D, U+FD40–U+FDCF, U+FDF0–U+FE1F, or U+FE30–U+FE44
>
> _标识符头（Head）_ → U+FE47–U+FFFD
>
> _标识符头（Head）_ → U+10000–U+1FFFD, U+20000–U+2FFFD, U+30000–U+3FFFD, or U+40000–U+4FFFD
>
> _标识符头（Head）_ → U+50000–U+5FFFD, U+60000–U+6FFFD, U+70000–U+7FFFD, or U+80000–U+8FFFD
>
> _标识符头（Head）_ → U+90000–U+9FFFD, U+A0000–U+AFFFD, U+B0000–U+BFFFD, or U+C0000–U+CFFFD
>
> _标识符头（Head）_ → U+D0000–U+DFFFD or U+E0000–U+EFFFD
>
> _标识符字符_ → 数值 0 到 9
>
> _标识符字符_ → U+0300–U+036F, U+1DC0–U+1DFF, U+20D0–U+20FF, or U+FE20–U+FE2F
>
> _标识符字符_ → [标识符头（Head）](./02_Lexical_Structure.md#identifier-head)
>
> _标识符字符集_ → [标识符字符](./02_Lexical_Structure.md#identifier-character) [标识符字符集](./02_Lexical_Structure.md#identifier-characters)<sub>可选</sub>
>
> _隐式参数名_ → **$** [十进制数字集](./02_Lexical_Structure.md#decimal-digits)
>
> _属性包装器呈现值_ → **$** [标识符字符集](./02_Lexical_Structure.md#identifier-characters)

<!-- -->

> 字面量语法
>
> _字面量_ → [数值型字面量](./02_Lexical_Structure.md#numeric-literal) | [字符串字面量](./02_Lexical_Structure.md#string-literal) | [布尔字面量](./02_Lexical_Structure.md#boolean-literal) | [空字面量](./02_Lexical_Structure.md#nil-literal)
>
> _数值型字面量_ → **-**<sub>可选</sub>[整形字面量](./02_Lexical_Structure.md#integer-literal) | **-**<sub>可选</sub>[浮点型字面量](./02_Lexical_Structure.md#floating-point-literal)
>
> _布尔字面量_ → **true** | **false**
>
> _空字面量_ → **nil**

<!-- -->

> 整型字面量语法
>
> _整型字面量_ → [二进制字面量](./02_Lexical_Structure.md#binary-literal)
>
> _整型字面量_ → [八进制字面量](./02_Lexical_Structure.md#octal-literal)
>
> _整型字面量_ → [十进制字面量](./02_Lexical_Structure.md#decimal-literal)
>
> _整型字面量_ → [十六进制字面量](./02_Lexical_Structure.md#hexadecimal-literal)
>
> _二进制字面量_ → **0b** [二进制数字](./02_Lexical_Structure.md#binary-digit) [二进制字面量字符集](./02_Lexical_Structure.md#binary-literal-characters)<sub>可选</sub>
>
> _二进制数字_ → 数值 0 到 1
>
> _二进制字面量字符_ → [二进制数字](./02_Lexical_Structure.md#binary-digit) | **-**
>
> _二进制字面量字符集_ → [二进制字面量字符](./02_Lexical_Structure.md#binary-literal-character) [二进制字面量字符集](./02_Lexical_Structure.md#binary-literal-characters)<sub>可选</sub>
>
> _八进制字面量_ → **0o** [八进制数字](./02_Lexical_Structure.md#octal-digit) [八进制字符集](./02_Lexical_Structure.md#octal-literal-characters)<sub>可选</sub>
>
> _八进字数字_ → 数值 0 到 7
>
> _八进制字符_ → [八进制数字](./02_Lexical_Structure.md#octal-digit) | **-**
>
> _八进制字符集_ → [八进制字符](./02_Lexical_Structure.md#octal-literal-character) [八进制字符集](./02_Lexical_Structure.md#octal-literal-characters)<sub>可选</sub>
>
> _十进制字面量_ → [十进制数字](./02_Lexical_Structure.md#decimal-digit) [十进制字符集](./02_Lexical_Structure.md#decimal-literal-characters)<sub>可选</sub>
>
> _十进制数字_ → 数值 0 到 9
>
> _十进制数字集_ → [十进制数字](./02_Lexical_Structure.md#decimal-digit) [十进制数字集](./02_Lexical_Structure.md#decimal-digits)<sub>可选</sub>
>
> _十进制字面量字符_ → [十进制数字](./02_Lexical_Structure.md#decimal-digit) | **-**
>
> _十进制字面量字符集_ → [十进制字面量字符](./02_Lexical_Structure.md#decimal-literal-character) [十进制字面量字符集](./02_Lexical_Structure.md#decimal-literal-characters)<sub>可选</sub>
>
> _十六进制字面量_ → **0x** [十六进制数字](./02_Lexical_Structure.md#hexadecimal-digit) [十六进制字面量字符集](./02_Lexical_Structure.md#hexadecimal-literal-characters)<sub>可选</sub>
>
> _十六进制数字_ → 数值 0 到 9，a 到 f，或者 A 到 F
>
> _十六进制字符_ → [十六进制数字](./02_Lexical_Structure.md#hexadecimal-digit) | **-**
>
> _十六进制字面量字符集_ → [十六进制字符](./02_Lexical_Structure.md#hexadecimal-literal-character) [十六进制字面量字符集](./02_Lexical_Structure.md#hexadecimal-literal-characters)<sub>可选</sub>

<!-- -->

> 浮点型字面量语法
>
> _浮点数字面量_ → [十进制字面量](./02_Lexical_Structure.md#decimal-literal) [十进制分数](./02_Lexical_Structure.md#decimal-fraction)<sub>可选</sub>[十进制指数](./02_Lexical_Structure.md#decimal-exponent)<sub>可选</sub>
>
> _浮点数字面量_ → [十六进制字面量](./02_Lexical_Structure.md#hexadecimal-literal) [十六进制分数](./02_Lexical_Structure.md#hexadecimal-fraction)<sub>可选</sub>[十六进制指数](./02_Lexical_Structure.md#hexadecimal-exponent)
>
> _十进制分数_ → **.** [十进制字面量](./02_Lexical_Structure.md#decimal-literal)
>
> _十进制指数_ → [浮点数 e](./02_Lexical_Structure.md#floating-point-e) [正负号](./02_Lexical_Structure.md#sign)<sub>可选</sub>[十进制字面量](./02_Lexical_Structure.md#decimal-literal)
>
> _十六进制分数_ → **.** [十六进制数](./02_Lexical_Structure.md#hexadecimal-literal)
>
> _十六进制指数_ → [浮点数 p](./02_Lexical_Structure.md#floating-point-p) [正负号](./02_Lexical_Structure.md#sign)<sub>可选</sub>[十六进制字面量](./02_Lexical_Structure.md#hexadecimal-literal)
>
> _浮点数 e_ → **e** | **E**
>
> _浮点数 p_ → **p** | **P**
>
> _正负号_ → **+** | **-**

<!-- -->

> 字符串型字面量语法

> _字符串字面量_ → [静态字符串字面量](./02_Lexical_Structure.md#static-string-literal) | [插值字符串字面量](./02_Lexical_Structure.md#interpolated-string-literal)
>
> _字符串开分隔定界符_ → [字符串扩展分隔符](./02_Lexical_Structure.md#extended-string-literal-delimiter) **"**
>
> _字符串闭分隔定界符_ → **"** [字符串扩展分隔符](./02_Lexical_Structure.md#extended-string-literal-delimiter)<sub>可选</sub>
>
> _静态字符串字面量_ → [字符串开分隔定界符](./02_Lexical_Structure.md#extended-string-literal-delimiter) [引用文本](./02_Lexical_Structure.md#quoted-text)<sub>可选</sub> [字符串闭分隔定界符](./02_Lexical_Structure.md#extended-string-literal-delimiter)
>
> _静态字符串字面量_ → [多行字符串开分隔定界符](./02_Lexical_Structure.md#extended-string-literal-delimiter) [多行引用文本](./02_Lexical_Structure.md#multiline-quoted-text)<sub>可选</sub> [多行字符串闭分隔定界符](./02_Lexical_Structure.md#extended-string-literal-delimiter)
>
> _多行字符串开分隔定界符_ → [字符串扩展分隔符](./02_Lexical_Structure.md#extended-string-literal-delimiter) **"""**
>
> _多行字符串闭分隔定界符_ → **"""** [字符串扩展分隔符](./02_Lexical_Structure.md#extended-string-literal-delimiter)
>
> _字符串扩展分隔符_ → **#** [字符串扩展分隔符](./02_Lexical_Structure.md#extended-string-literal-delimiter)<sub>可选</sub>
>
> _引用文本_ → [引用文本项](./02_Lexical_Structure.md#quoted-text-item) [引用文本](#quoted-text)<sub>可选</sub>
>
> _引用文本项_ → [转义字符](./02_Lexical_Structure.md#escaped-character)
>
> _引用文本项_ → 除了 **"**、\*\*\\\*\*、U+000A、U+000D 以外的所有 Unicode 字符
>
> _多行引用文本_ → [多行引用文本项](./02_Lexical_Structure.md#multiline-quoted-text-item) [多行引用文本](./02_Lexical_Structure.md#multiline-quoted-text)<sub>可选</sub>
>
> _多行引用文本项_ [转义字符](./02_Lexical_Structure.md#escaped-character)<sub>可选</sub>
>
> _多行引用文本_ → 除了 **\\** 以外的任何 Unicode 标量值
>
> _多行引用文本_ → [转义换行](./02_Lexical_Structure.md#escaped-newline)

> _插值字符串字面量_ → [字符串开分隔定界符](./02_Lexical_Structure.md#extended-string-literal-delimiter) [插值文本](./02_Lexical_Structure.md#interpolated-text)<sub>可选</sub> [字符串闭分隔定界符](./02_Lexical_Structure.md#extended-string-literal-delimiter)
>
> _插值字符串字面量_ → [多行字符串开分隔定界符](./02_Lexical_Structure.md#extended-string-literal-delimiter) [插值文本](./02_Lexical_Structure.md#interpolated-text)<sub>可选</sub> [多行字符串闭分隔定界符](./02_Lexical_Structure.md#extended-string-literal-delimiter)
>
> _插值文本_ → [插值文本项](./02_Lexical_Structure.md#interpolated-text-item) [插值文本](./02_Lexical_Structure.md#interpolated-text)<sub>可选</sub>
>
> _插值文本项_ → **\\**(**[表达式](./04_Expressions.md)**) | [引用文本项](./02_Lexical_Structure.md#quoted-text-item)
>
> _多行插值文本_ → [多行插值文本项](./02_Lexical_Structure.md#multiline-quoted-text-item) [多行插值文本](./02_Lexical_Structure.md#multiline-quoted-text)<sub>可选</sub>
>
> _多行插值文本项_ → **\\(** [表达式](./04_Expressions.md) **)** | [多行引用文本项](./02_Lexical_Structure.md#multiline-quoted-text-item)
>
> _转义序列_ → **\\** [字符串扩展分隔符](./02_Lexical_Structure.md#extended-string-literal-delimiter)
>
> _转义字符_ → [转义序列](./02_Lexical_Structure.md#escape-sequence) **0** | [转义序列](./02_Lexical_Structure.md#escape-sequence) **\\** | [转义序列](./02_Lexical_Structure.md#escape-sequence) **t** | [转义序列](#escape-sequence) **n** | [转义序列](./02_Lexical_Structure.md#escape-sequence) **r** | [转义序列](./02_Lexical_Structure.md#escape-sequence) **\"** | [转义序列](./02_Lexical_Structure.md#escape-sequence) **'**
>
> _转义字符_ → [转义序列](./02_Lexical_Structure.md#escape-sequence) **u {** [unicode 标量数字](./02_Lexical_Structure.md#unicode-scalar-digits) **}**
>
> _unicode 标量数字_ → 一到八位的十六进制数字
>
> _转义换行符_ → [转义序列](./02_Lexical_Structure.md#escape-sequence) [空白](./02_Lexical_Structure.md#whitespace)<sub>可选</sub> [换行符](./02_Lexical_Structure.md#line-break)

<!-- -->

> 运算符语法语法
>
> _运算符_ → [运算符头](./02_Lexical_Structure.md#operator-character) [运算符字符集](./02_Lexical_Structure.md#operator)<sub>可选</sub>
>
> _运算符_ → [点运算符头](./02_Lexical_Structure.md#dot-operator-head) [点运算符字符集](./02_Lexical_Structure.md#dot-operator-characters)<sub>可选</sub>
>
> _运算符字符_ → **/** | **=** | **-** | **+** | **!** | **\*** | **%** | **<** | **>** | **&** | **|** | **^** | **~** | **?**
>
> _运算符头_ → U+00A1–U+00A7
>
> _运算符头_ → U+00A9 or U+00AB
>
> _运算符头_ → U+00AC or U+00AE
>
> _运算符头_ → U+00B0–U+00B1, U+00B6, U+00BB, U+00BF, U+00D7, or U+00F7
>
> _运算符头_ → U+2016–U+2017 or U+2020–U+2027
>
> _运算符头_ → U+2030–U+203E
>
> _运算符头_ → U+2041–U+2053
>
> _运算符头_ → U+2055–U+205E
>
> _运算符头_ → U+2190–U+23FF
>
> _运算符头_ → U+2500–U+2775
>
> _运算符头_ → U+2794–U+2BFF
>
> _运算符头_ → U+2E00–U+2E7F
>
> _运算符头_ → U+3001–U+3003
>
> _运算符头_ → U+3008–U+3030
>
> _运算符字符_ → [运算符头](./02_Lexical_Structure.md#operator-head)
>
> _运算符字符_ → U+0300–U+036F
>
> _运算符字符_ → U+1DC0–U+1DFF
>
> _运算符字符_ → U+20D0–U+20FF
>
> _运算符字符_ → U+FE00–U+FE0F
>
> _运算符字符_ → U+FE20–U+FE2F
>
> _运算符字符_ → U+E0100–U+E01EF
>
> _运算符字符集_ → [运算符字符](./02_Lexical_Structure.md#operator-character) [运算符字符集](./02_Lexical_Structure.md#operator-characters)<sub>可选</sub>
>
> _点运算符头_ → **..**
>
> _点运算符字符_ → **.** | [运算符字符](./02_Lexical_Structure.md#operator-character)
>
> _点运算符字符集_ → [点运算符字符](./02_Lexical_Structure.md#dot-operator-character) [点运算符字符集](./02_Lexical_Structure.md#dot-operator-characters)<sub>可选</sub>
>
> _二元运算符_ → [运算符](./02_Lexical_Structure.md#operator)
>
> _前置运算符_ → [运算符](./02_Lexical_Structure.md#operator)
>
> _后置运算符_ → [运算符](./02_Lexical_Structure.md#operator)

## 类型

> 类型语法
>
> _类型_ → [数组类型](./03_Types.md#array-type)
>
> _类型_ → [字典类型](./03_Types.md#dictionary-type)
>
> _类型_ → [函数类型](./03_Types.md#function-type)
>
> _类型_ → [类型标识符](./03_Types.md#type-identifier)
>
> _类型_ → [元组类型](./03_Types.md./03_Types.md#tuple-type)
>
> _类型_ → [可选类型](./03_Types.md#optional-type)
>
> _类型_ → [隐式解析可选类型](./03_Types.md#implicitly-unwrapped-optional-type)
>
> _类型_ → [协议合成类型](./03_Types.md#protocol-composition-type)
>
> _类型_ → **Any**
>
> _类型_ → **Self**
>
> _类型_ → **（** [type](./03_Types.md#metatype-type) **）**

<!-- -->

> 类型注解语法
>
> _类型注解_ → **:** [属性（Attributes）集](./07_Attributes.md#attributes)<sub>可选</sub>[类型](./03_Types.md#type)

<!-- -->

> 类型标识语法
>
> _类型标识_ → [类型名称](./03_Types.md#type-name) [泛型参数从句](./09_Generic_Parameters_and_Arguments.md#generic-argument-clause)<sub>可选</sub>| [类型名称](./03_Types.md#type-name) [泛型参数从句](./09_Generic_Parameters_and_Arguments.md#generic-argument-clause)<sub>可选</sub>**.** [类型标识符](./03_Types.md#type-identifier)
>
> _类型名_ → [标识符](./02_Lexical_Structure.md#identifier)

<!-- -->

> 元组类型语法
>
> _元组类型_ → **(** **)** | **(** [元组类型元素](./03_Types.md#tuple-type-element) **,** [元组类型元素列表](./03_Types.md#tuple-type-element-list) **)**
>
> _元组类型元素列表_ → [元组类型元素](./03_Types.md#tuple-type-element) | [元组类型元素](./03_Types.md#tuple-type-element) **,** [元组类型元素列表](./03_Types.md#tuple-type-element-list)
>
> _元组类型元素_ → [元素名](./03_Types.md#element-name) [类型注解](./03_Types.md#type-annotation) | [类型](./03_Types.md#type)
>
> _元素名_ → [标识符](./02_Lexical_Structure.md#identifier)

<!-- -->

> 函数类型语法
>
> _函数类型_ → [类型](./03_Types.md#type) **throws**<sub>可选</sub>**->** [类型](./03_Types.md#type)
>
> _函数类型_ → [类型](./03_Types.md#) **rethrows** **->** [类型](./03_Types.md#)
>
> _函数类型子句_ → **(** **)**
>
> _函数类型子句_ → **(** [函数类型参数列表](./03_Types.md#function-type-argument-list) *...*­<sub>可选</sub> **)**
>
> _函数类型参数列表_ → [函数类型参数](./03_Types.md#function-type-argument) | [函数类型参数](function-type-argument)， [函数类型参数列表](./03_Types.md#function-type-argument-list)
>
> _函数类型参数_ → [特性列表](./07_Attributes.md#attributes)<sub>可选</sub> **输入输出参数**<sub>可选</sub> [类型](#type) | [参数标签](#argument-label) [类型注解](#type-annotation)
>
> _参数标签_ → [标识符](./02_Lexical_Structure.md#identifier)

<!-- -->

> 数组类型语法
>
> _数组类型_ → **[** [_类型_](./03_Types.md#array-type) **]**

<!-- -->

> 字典类型语法
>
> _字典类型_ → **[** [类型 **:** 类型](./03_Types.md#type) **]**

<!-- -->

> 可选类型语法
>
> _可选类型_ → [类型](./03_Types.md#type) **?**

<!-- -->

> 隐式解析可选类型（Implicitly Unwrapped Optional Type）语法
>
> _隐式解析可选类型_ → [类型](./03_Types.md#type) **!**

<!-- -->

> 协议合成类型语法
>
> _协议合成类型_ → [类型标识符](./03_Types.md#type-identifier) | [协议合成延续](./03_Types.md#protocol-composition-continuation)
>
> _协议持续延续_ → [类型标识符](./03_Types.md#type-identifier) | [协议合成类型](./03_Types.md#protocol-composition-type)

<!-- -->

> 元（Metatype）类型语法
>
> _元类型_ → [类型](./03_Types.md#type) **.** **Type** | [类型](./03_Types.md#type) **.** **Protocol**

<!-- -->

> 类型继承从句语法
>
> _类型继承从句_ → **:** [类型继承集](./03_Types.md#type-inheritance-list)
>
> _类型继承集_ → [类型标识符](./03_Types.md#type-identifier) | [类型标识符](./03_Types.md#type-identifier) **,** [类型继承集](./03_Types.md#type-inheritance-list)
>
> _类条件_ → **class**

## 表达式

> 表达式语法
>
> _表达式_ → [try 运算符](./04_Expressions.md#try-operator)<sub>可选</sub> [前缀表达式](./04_Expressions.md#prefix-expression) [二元表达式列表](./04_Expressions.md#binary-expressions)
>
> _表达式列表_ → [表达式](./04_Expressions.md#expression)|[表达式](./04_Expressions.md#expression), [表达式列表](./04_Expressions.md#expression-list)

<!-- -->

> 前缀表达式语法
>
> _前缀表达式_ → [前缀操作符]()<sub>可选</sub> [前缀表达式](./04_Expressions.md#prefix-expression)
>
> _前缀表达式_ → [输入输出表达式](./04_Expressions.md#in-out-expression)
>
> _输入输出表达式_ → **&** [标识符](./02_Lexical_Structure.md#identifier)

<!-- -->

> try 表达式语法
>
> _try 操作符_ → **try** | **try ? ** | ** try ! **

<!-- -->

> 二元表达式语法
>
> _二元表达式_ → [二元运算符](./02_Lexical_Structure.md#binary-operator) [前缀表达式](./04_Expressions.md#prefix-expression)
>
> _二元表达式_ → [赋值操作符](./06_Declarations.md#class-declaration) [try 运算符](./04_Expressions.md#try-operator)<sub>可选</sub> [前缀表达式](./04_Expressions.md#prefix-expression)
>
> _二元表达式_ → [条件运算符](./04_Expressions.md#conditional-operator) [try 运算符](./04_Expressions.md#try-operator)<sub>可选</sub> [前缀表达式](./04_Expressions.md#prefix-expression)
>
> _二元表达式_ → [类型转换运算符](./04_Expressions.md#type-casting-operator)
>
> _二元表达式_ → [二元表达式](./04_Expressions.md#binary-expression) [二元表达式列表](./04_Expressions.md#binary-expressions)<sub>可选</sub>

<!-- -->

> 赋值操作符语法
>
> _赋值运算符_ → [=]

<!-- -->

> 条件运算符
>
> _条件运算符_ → [?] [表达式](./04_Expressions.md#expression):

> 类型转换运算符语法
>
> _类型转换运算符_ → [is] [类型](./03_Types.md#type)
>
> _类型转换运算符_ → [as] [类型](./03_Types.md#type)
>
> _类型转换运算符_ → [as ?] [类型](./03_Types.md#type)
>
> _类型转换运算符_ → [as !] [类型](./03_Types.md#type)

<!-- -->

> 基础表达式语法
>
> _基础表达式_ → [标识符](./02_Lexical_Structure.md#identifier) [泛型实参子句](./09_Generic_Parameters_and_Arguments.md#generic-argument-clause)<sub>可选</sub>
>
> _基础表达式_ → [字面量表达式](./04_Expressions.md#literal-expression)
>
> _基础表达式_ → [self 表达式](./04_Expressions.md#self-expression)
>
> _基础级表达式_ → [父类表达式](./04_Expressions.md#superclass-expression)
>
> _基础表达式_ → [闭包表达式](./04_Expressions.md#closure-expression)
>
> _基础表达式_ → [圆括号表达式](./04_Expressions.md#parenthesized-expression)
>
> _基础表达式_ → [元组表达式](./04_Expressions.md#Tuple-Expression)
>
> _基础表达式_ → [隐式成员表达式](./04_Expressions.md#implicit-member-expression)
>
> _基础表达式_ → [通配符表达式](./04_Expressions.md#wildcard-expression)
>
> _基础表达式_ → [key-path 表达式](./04_Expressions.md#key-path-expression)
>
> _基础表达式_ → [选择器表达式](./04_Expressions.md#selector-expression)
>
> _基础表达式_ → [key-path 字符串表达式](./04_Expressions.md#key-patch-string-expression)

<!-- -->

> 字面量表达式语法
>
> _字面量表达式_ → [字面量](./04_Expressions.md#literal-expression)
>
> _字面量表达式_ → [数组字面量](./04_Expressions.md#array-literal) | [字典字面量](./04_Expressions.md#dictionary-literal) | [练习场字面量](./04_Expressions.md#playground-literal)
>
> _字面量表达式_ → **#file** | **#filePath** | **#line** | **#column** | **#function** | **dsohandle**
>
> _数组字面量_ → **[** [数组字面量项列表](./04_Expressions.md#array-literal-items)<sub>可选</sub> **]** > _数组字面量项列表_ → [数组字面量项](./04_Expressions.md#array-literal-item)<sub>可选</sub> | [数组字面量项](./04_Expressions.md#array-literal-item),[数组字面量项列表](./04_Expressions.md#array-literal-items) > _数组字面量项_ → [表达式](./04_Expressions.md#expression)
>
> _字典字面量_ → [[字典字面量项列表](./04_Expressions.md#dictionary-literal-items) **]** | **[** **:** **]**
>
> _字典字面量项列表_ → [字典字面量项](./04_Expressions.md#dictionary-literal-item) ,\*\*<sub>可选</sub> | [字典字面量项](./04_Expressions.md#dictionary-literal-item) ,[字典字面量项列表](./04_Expressions.md#dictionary-literal-items)
>
> _字典字面量项_ → [表达式](./04_Expressions.md#expression) **:** [表达式](./04_Expressions.md#expression)
>
> _palyground 字面量_ → **#colorLiteral ( red : [表达式](./04_Expressions.md#expression) , green :[表达式](./04_Expressions.md#expression), blue :[表达式](./04_Expressions.md#expression) , alpha : [表达式](./04_Expressions.md#expression) )**
>
> _playground 字面量_ → **#fileLiteral ( resourceName : [表达式](#expression) )**
>
> _playground 字面量_ → \*\*#imageLiteral ( resourceName : [表达式](#expression) )
>
> <!-- -->

> self 表达式语法
>
> _self 表达式_ → **self** | [self 方法表达式](./04_Expressions.md#self-method-expression) ｜ [self 下标表达式](./04_Expressions.md#self-subscript-expression) | [self 构造器表达式](./04_Expressions.md#self-initializer-expression)
>
> _self 方法表达式_ → **self** **.** [标识符](./02_Lexical_Structure.md#identifier)
>
> _self 下标表达式_ → **self** **[** [函数调用参数表](./04_Expressions.md#function-call-argument-list­) **]**
>
> _self 构造器表达式_ → **self** **.** **init**

<!-- -->

> 父类表达式语法
>
> _父类表达式_ → [父类方法表达式](./04_Expressions.md#superclass-method-expression) | [父类下标表达式](./04_Expressions.md#superclass-subscript-expression) | [父类构造器表达式](./04_Expressions.md#superclass-initializer-expression)
>
> _父类方法表达式_ → **super** **.** [标识符](./02_Lexical_Structure.md#identifier)
>
> _父类下标表达式_ → **super** [[函数调用参数表](./04_Expressions.md#function-call-argument-list­) **]**
>
> _父类构造器表达式_ → **super** **.** **init**

<!-- -->

> 闭包表达式语法
>
> _闭包表达式_ → **{** [闭包签名](./04_Expressions.md#closure-signature)<sub>可选</sub> [语句](./04_Expressions.md#statements) **}**
>
> 闭包签名\* → [参数子句](./04_Expressions.md#parameter-clause) [函数结果](./06_Declarations.md#function-result)<sub>可选</sub> **in**
>
> _闭包签名_ → [标识符列表](./04_Expressions.md#identifier-list) [函数结果](./06_Declarations.md#function-result)<sub>可选</sub> **in**
>
> _闭包参数子句_ **(** **)** | **(** [闭包参数列表](./04_Expressions.md#closure-parameter-list) | [标识符列表](./04_Expressions.md#identifier-list) **)**
>
> _闭包参数列表_ [闭包参数](./04_Expressions.md#implicit-member-expression) | [闭包参数](./04_Expressions.md#implicit-member-expression), [闭包参数列表](./04_Expressions.md#implicit-member-expression)
>
> _闭包参数_ [闭包参数名](./04_Expressions.md#implicit-member-expression) [类型声明](./03_Types.md#type-annotation) <sub>可选</sub>
>
> _闭包参数_ [闭包参数名](./04_Expressions.md#implicit-member-expression) [类型声明](./03_Types.md#type-annotation) **...**
>
> _闭包参数名_ [标识符](./02_Lexical_Structure.md#identifier)
>
> _捕获列表_ → [捕获列表](./04_Expressions.md#capture-list) **[** [捕获列表项列表](./04_Expressions.md#capture-list-items) **]**
>
> _捕获列表项列表_ → [捕获列表项](./04_Expressions.md#capture-list-item) | [捕获列表项](./04_Expressions.md#capture-list-item) **,** [捕获列表项列表](./04_Expressions.md#capture-list-items)
>
> _捕获列表项_ → [捕获说明符](./04_Expressions.md#capture-specifier)<sub>可选</sub> [_表达式_](./04_Expressions.md#expression)
>
> _捕获说明符_ → **weak** | **unowned** | **unowned(safe)** | **unowned(unsafe)**

<!-- -->

> 隐式成员表达式语法
>
> _隐式成员表达式_ → **.** [标识符](./02_Lexical_Structure.md#identifier)

<!-- -->

> 圆括号表达式语法
>
> _圆括号表达式_ → **( [表达式](./04_Expressions.md#expression) )**

<!-- -->

> 元组表达式语法
>
> _元组表达式_ → **( )** | **(**[元组元素](./04_Expressions.md#tuple-element)， [元组元素列表](./04_Expressions.md#tuple-element-list) **)**
>
> _元组元素列表_ → [元组元素](./04_Expressions.md#tuple-element) | [元组元素](./04_Expressions.md#tuple-element) **,** [元组元素列表](./04_Expressions.md#tuple-element-list) > _元组元素_ → [表达式](./04_Expressions.md#expression) | [标识符](./04_Expressions.md#identifier) **:** [表达式](./04_Expressions.md##expression)

<!-- -->

> 通配符表达式语法
>
> _通配符表达式_ → **\_**

<!-- -->

> key-path 表达式语法
>
> _key-path 表达式_ → **\*\* [类型](./03_Types.md#type)<sub>可选</sub> **.** [多个 key-path 组件] > _多个 key-path 组件_ → [key-path 组件](./04_Expressions.md#key-path-component) | [key-path 组件](./04_Expressions.md#key-path-component) **.\** [多个 key-path 组件](./04_Expressions.md#key-path-components) > *key-path 组件* → [标识符](./02_Lexical_Structure.md#identifier) [多个 key-path 后缀](./04_Expressions.md#key-path-postfixes)<sub>可选<sub> | [多个 key-path 后缀](./04_Expressions.md#key-path-postfixes) > *多个 key-path 后缀\* → [key-path 后缀](./04_Expressions.md#key-path-postfix) [多个 key-path 后缀](./04_Expressions.md#key-path-postfixes)<sub>可选<sub> key-path-postfixes {./04_Expressions.md#key-path-postfixes}
>
> _key-path 后缀_ → **?** | **!** | **self** | **\[** [函数调用参数表](./04_Expressions.md#function-call-argument-list) **\]**

<!-- -->

> 选择器表达式语法
>
> _选择器表达式_ → **#selector** **(** [_表达式_](./04_Expressions.md#expression) **)**
>
> _选择器表达式_ → **#selector** **(** [_getter:表达式_](./04_Expressions.md#expression) **)**
>
> _选择器表达式_ → **#selector** **(** [_setter:表达式_](./04_Expressions.md#expression) **)**

<!-- -->

> key-path 字符串表达式语法
> _key-path 字符串表达式_ → **#keyPath (** [表达式](./04_Expressions.md#expression) **)**

<!-- -->

> 后缀表达式表达式语法
>
> _后缀表达式_ → [基本表达式](./04_Expressions.md#primary-expression)
>
> _后缀表达式_ → [后缀表达式](./04_Expressions.md#postfix-expression) [后缀运算符](02_Lexical_Structure.md#postfix-operator)
>
> _后缀表达式_ → [函数调用表达式](./04_Expressions.md#function-call-expression)
>
> _后缀表达式_ → [构造器表达式](./04_Expressions.md#initializer-expression)
>
> _后缀表达式_ → [显式成员表达式](./04_Expressions.md#explicit-member-expression)
>
> _后缀表达式_ → [后缀 self 表达式](./04_Expressions.md#postfix-self-expression)
>
> _后缀表达式_ → [下标表达式](./04_Expressions.md#subscript-expression)
>
> _后缀表达式_ → [强制取值表达式](./04_Expressions.md#forced-value-expression)
>
> _后缀表达式_ → [可选链表达式](./04_Expressions.md#optional-chaining-expression)

<!-- -->

> 函数调用表达式语法
>
> _函数调用表达式_ → [后缀表达式](./04_Expressions.md#postfix-expression) [函数调用参数子句](./04_Expressions.md#function-call-argument-clause)
>
> _函数调用表达式_ → [后缀表达式](./04_Expressions.md#postfix-expression) [函数调用参数子句](./04_Expressions.md#function-call-argument-clause)<sub>可选</sub> [尾随闭包](./04_Expressions.md#trailing-closure)
>
> _函数调用参数子句_ → **(** **)** | **(** [函数调用参数表](./04_Expressions.md#function-call-argument-list) **)**
>
> _函数调用参数表_ → [函数调用参数](./04_Expressions.md#function-call-argument) | [函数调用参数](./04_Expressions.md#function-call-argument) **,** [函数调用参数表](./04_Expressions.md#function-call-argument-list)
>
> _函数调用参数_ → [表达式](./04_Expressions.md#expression) | [标识符](02_Lexical_Structure.md#identifier) **:** [表达式](./04_Expressions.md#expression)
>
> _函数调用参数_ → [运算符](./02_Lexical_Structure.md#operator) | [标识符](./02_Lexical_Structure.md#identifier) **:** [运算符](./02_Lexical_Structure.md#operator)
>
> _尾随闭包_ → [闭包表达式](./04_Expressions.md#closure-expression) [标签尾随闭包]()<sub>可选</sub>
>
> *标签尾随闭包集*→ [标签尾随闭包](./04_Expressions.md#labeled-trailing-closure) [标签尾随闭包集](./04_Expressions.md#labeled-trailing-closures)
>
> *标签尾随闭包*→ [标识符](./02_Lexical_Structure.md#identifier) **:** [闭包表达式](./04_Expressions.md#closure-expression)

<!-- -->

> 初始化表达式语法
>
> _构造器表达式_ → [后缀表达式](./04_Expressions.md#postfix-expression) **.** **init**
>
> _构造器表达式_ → [后缀表达式](./04_Expressions.md#postfix-expression) **.** **init** **(** [参数名称](./04_Expressions.md#argument-names) **)**

<!-- -->

> 显式成员表达式语法
>
> _显式成员表达式_ → [后缀表达式](./04_Expressions.md#postfix-expression) **.** [十进制数字] (02_Lexical_Structure.md#decimal-digit)
>
> _显式成员表达式_ → [后缀表达式](./04_Expressions.md#postfix-expression) **.** [标识符](02_Lexical_Structure.md#identifier) [泛型实参子句](./09_Generic_Parameters_and_Arguments.md#generic-argument-clause)<sub>可选</sub><br/>
>
> _显式成员表达式_ → [后缀表达式](./04_Expressions.md#postfix-expression) **.** [标识符] (02_Lexical_Structure.md#identifier) **(** [参数名称](./04_Expressions.md#argument-names) **)**
>
> _参数名称_ → [参数名](./04_Expressions.md#argument-name) [参数名称](./04_Expressions.md#argument-names)<sub>可选</sub><br/>
>
> _参数名_ → [标识符](./02_Lexical_Structure.md#identifier) **:**

<!-- -->

> 后缀 self 表达式语法
>
> _后缀 self 表达式_ → [后缀表达式](./04_Expressions.md#postfix-expression) **.** **self**

<!-- -->

> 下标表达式语法
>
> _下标表达式_ → [后缀表达式](./04_Expressions.md#postfix-expression) **[** [表达式列表](./04_Expressions.md#expression-list) **]**

<!-- -->

> 强制取值表达式语法
> _强制取值表达式_ → [后缀表达式](./04_Expressions.md#postfix-expression) **!**

<!-- -->

> 可选链式表达式语法
> _可选链表达式_ → [后缀表达式](./04_Expressions.md#postfix-expression) **?**

## 语句

> 语句语法
>
> _语句_ → [表达式](./04_Expressions.md#expression) **;**<sub>可选</sub>
>
> _语句_ → [声明](./06_Declarations.md#declaration) **;**<sub>可选</sub>
>
> _语句_ → [循环语句](./05_Statements.md#loop-statement) **;**<sub>可选</sub>
>
> _语句_ → [分支语句](./05_Statements.md#branch-statement) **;**<sub>可选</sub>
>
> _语句_ → [标签语句](./05_Statements.md#labeled-statement) **;**<sub>可选</sub>
>
> _语句_ → [控制转移语句](./05_Statements.md#control-transfer-statement) **;**<sub>可选</sub>
>
> _语句_ → [延迟语句](./05_Statements.md#defer-statement) **;**<sub>可选</sub>
>
> _语句_ → [执行语句](./05_Statements.md#do-statement) **;**<sub>可选</sub>
>
> _语句_ → [编译控制语句](./05_Statements.md#compiler-control-statement)
>
> _语句集_ → [语句](./05_Statements.md#statement) [语句集](./05_Statements.md#statements)<sub>可选</sub>

<!-- -->

> 循环语句语法
>
> _循环语句_ → [for-in 语句](./05_Statements.md#for-in-statement)
>
> _循环语句_ → [while 语句](./05_Statements.md#wheetatype 类型 ile-statement)
>
> _循环语句_ → [repeat-while 语句](./05_Statements.md#do-while-statement)

<!-- -->

> For-In 循环语法
>
> _for-in 语句_ → **for case**<sub>可选</sub> [模式](./08_Patterns.md#pattern) **in** [表达式](./04_Expressions.md#expression) [where 子句](./05_Statements.md#where-clause)<sub>可选</sub> [代码块](./06_Declarations.md#code-block)

<!-- -->

> While 循环语法
>
> _while 语句_ → **while** [条件集](./05_Statements.md#condition-list) [代码块](./06_Declarations.md#code-block)
>
> _条件集_ → [条件](./05_Statements.md#condition) | [条件](./05_Statements.md#condition) **,** [条件集](./05_Statements.md#condition-list) > _条件_ → [表达式](./04_Expressions.md#expression) | [可用性条件](./05_Statements.md#availability-condition) | [case 条件](./05_Statements.md#case-condition) | [可选绑定条件](./05_Statements.md#optional-binding-condition)
>
> _case 条件_ → **case** [模式](./08_Patterns.md#pattern) [构造器](./06_Declarations.md#initializer)
>
> _可选绑定条件_ → **let** [模式](./08_Patterns.md#pattern) [构造器](./06_Declarations.md#initializer) | **var** [模式](./08_Patterns.md#pattern) [构造器](./06_Declarations.md#initializer)

<!-- -->

> Repeat-While 语句语法
>
> _repeat-while-statement_ → **repeat** [代码块](./06_Declarations.md#code-block) **while** [表达式](./04_Expressions.md#expression)

<!-- -->

> 分支语句语法
>
> _分支语句_ → [if 语句](./05_Statements.md#if-statement)
>
> _分支语句_ → [guard 语句](./05_Statements.md#guard-statement)
>
> _分支语句_ → [switch 语句](./05_Statements.md#switch-statement)

<!-- -->

> If 语句语法
>
> _if 语句_ → **if** [条件集](./05_Statements.md#condition-list) [代码块](./06_Declarations.md#code-block) [else 子句](./05_Statements.md#else-clause)<sub>可选</sub>
>
> _else 子句_ → **else** [代码块](./06_Declarations.md#code-block) | **else** [if 语句](./05_Statements.md#if-statement)

<!-- -->

> Guard 语句语法
>
> _guard 语句_ → **guard** [条件集](./05_Statements.md#condition-list) **else** [代码块](./06_Declarations.md#code-block)

<!-- -->

> Switch 语句语法
>
> _switch 语句_ → **switch** [表达式](./04_Expressions.md#expression) **{** [switch-case 集](./05_Statements.md#switch-cases)<sub>可选</sub> **}**
>
> _switch-case 集_ → [switch-case](./05_Statements.md#switch-case) [switch-case 集](./05_Statements.md#switch-cases)<sub>可选</sub>
>
> _switch-case_ → [case 标签](./05_Statements.md#case-label) [语句集](./05_Statements.md#statements)
>
> _switch-case_ → [default 标签](./05_Statements.md#default-label) [语句集](./05_Statements.md#statements)
>
> _switch-case_ → [条件 switch-case](./05_Statements.md#conditional-switch-case)
>
> _case 标签_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> **case** [case 项集](./05_Statements.md#case-item-list) **:**
>
> _case 项集_ → [模式](./08_Patterns.md#pattern) [where 子句](./05_Statements.md#where-clause)<sub>可选</sub> | [模式](./08_Patterns.md#pattern) [where 子句](./05_Statements.md#guard-clause)<sub>可选</sub> **,** [case 项集](./05_Statements.md#case-item-list)
>
> _default 标签_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> **default** **:**
>
> _where 子句_ → **where** [where 表达式](./05_Statements.md#where-expression)
>
> _where 表达式_ → [表达式](./04_Expressions.md#expression)
>
> _条件 switch-case_ → [switch if 指令子句](./05_Statements.md#switch-if-directive-clause) [switch elseif 指令子句集](./05_Statements.md#switch-elseif-directive-clauses)<sub>可选</sub> [switch else 指令子句](./05_Statements.md#switch-else-directive-clause)<sub>可选</sub> [endif 指令](./05_Statements.md#endif-directive)
>
> _switch if 指令子句_ → [if 指令](./05_Statements.md#if-directive) [编译条件](./05_Statements.md#compilation-condition) [switch-case 集](./05_Statements.md#switch-cases)<sub>可选</sub>
>
> _switch elseif 指令子句集_ → [elseif 指令子句](./05_Statements.md#else-if-directive-clause) [switch elseif 指令子句集](./05_Statements.md#switch-elseif-directive-clauses)<sub>可选</sub>
>
> _switch elseif 指令子句_ → [elseif 指令](./05_Statements.md#elseif-directive) [编译条件](./05_Statements.md#compilation-condition) [switch-case 集](./05_Statements.md#switch-cases)<sub>可选</sub>
>
> _switch else 指令子句_ → [else 指令](./05_Statements.md#else-directive) [switch-case 集](./05_Statements.md#switch-cases)<sub>可选</sub>

<!-- -->

> 标签语句语法
>
> _标签语句_ → [语句标签](./05_Statements.md#statement-label) [循环语句](./05_Statements.md#loop-statement)
>
> _标签语句_ → [语句标签](./05_Statements.md#statement-label) [if 语句](./05_Statements.md#if-statement)
>
> _标签语句_ → [语句标签](./05_Statements.md#statement-label) [switch 语句](./05_Statements.md#switch-statement)
>
> _标签语句_ → [语句标签](./05_Statements.md#statement-label) [do 语句](./05_Statements.md#do-statement)
>
> _语句标签_ → [标签名称](./05_Statements.md#label-name) **:**
>
> _标签名称_ → [标识符](./02_Lexical_Structure.md#identifier)

<!-- -->

> 控制转移语句语法
>
> _控制转移语句_ → [break 语句](./05_Statements.md#break-statement)
>
> _控制转移语句_ → [continue 语句](./05_Statements.md#continue-statement)
>
> _控制转移语句_ → [fallthrough 语句](./05_Statements.md#fallthrough-statement)
>
> _控制转移语句_ → [return 语句](./05_Statements.md#return-statement)
>
> _控制转移语句_ → [throw 语句](./05_Statements.md#throw-statement)

<!-- -->

> Break 语句语法
>
> _break 语句_ → **break** [标签名称](./05_Statements.md#label-name)<sub>可选</sub>

<!-- -->

> Continue 语句语法
>
> _continue 语句_ → **continue** [标签名称](./05_Statements.md#label-name)<sub>可选</sub>

<!-- -->

> Fallthrough 语句语法
>
> _fallthrough 语句_ → **fallthrough**

<!-- -->

> Return 语句语法
>
> _return 语句_ → **return** [表达式](./04_Expressions.md#expression)<sub>可选</sub>

<!-- -->

> Throw 语句语法
>
> _throw 语句_ → **throw** [表达式](./04_Expressions.md#expression)

<!-- -->

> Defer 语句语法
>
> _defer 语句_ → **defer** [代码块](./06_Declarations.md#code-block)

<!-- -->

> Do 语句语法
>
> _do 语句_ → **do** [代码块](./06_Declarations.md#code-block) [catch 子句集](./05_Statements.md#catch-clauses)<sub>可选</sub>
>
> _catch 子句集_ → [catch 子句](./05_Statements.md#catch-clause) [catch 子句集](05_Statements.md#catch-clauses)<sub>可选</sub>
>
> _catch 子句_ → **catch** [catch 模式列表]()<sub>可选</sub> [代码块](./06_Declarations.md#code-block)<sub>可选</sub>
>
> _catch 模式列表_ → [catch 模式](./05_Statements.md#catch-pattern) | [catch 模式](./05_Statements.md#catch-pattern) ，[catch 模式列表](./05_Statements.md#catch-pattern-list)
>
> _catch 模式_ → [模式](./08_Patterns.md#pattern) [where 子句](./05_Statements.md#where-clause)<sub>可选</sub>

<!-- -->

> 编译控制语句
>
> _编译控制语句_ → [条件编译块](./05_Statements.md#conditional-complation-block)
>
> _编译控制语句_ → [行控制语句](./05_Statements.md#line-control-statement)
>
> _编译控制语句_ → [诊断语句](./05_Statements.md#diagnostic-statement)

<!-- -->

> 条件编译块语法
>
> _条件编译块_ → [if 指令子句](./05_Statements.md#if-directive-clause) [elseif 指令子句集](./05_Statements.md#elseif-directive-clauses)<sub>可选</sub> [else 指令子句](./05_Statements.md#else-directive-clause)<sub>可选</sub> [endif 指令](./05_Statements.md#endif-directive)
>
> _if 指令子句_ → [if 指令](./05_Statements.md#if-directive) [编译条件](./05_Statements.md#compilation-condition) [语句集](./05_Statements.md#statements)<sub>可选</sub>
>
> _elseif 指令子句集_ → [elseif 指令子句](./05_Statements.md#else-if-directive-clause) [elseif 指令子句集](./05_Statements.md#elseif-directive-clauses)<sub>可选</sub>
>
> _elseif 指令子句_ → [elseif 指令](./05_Statements.md#elseif-directive) [编译条件](./05_Statements.md#compilation-condition) [语句集](./05_Statements.md#statements)<sub>可选</sub>
>
> _else 指令子句_ → [else 指令](./05_Statements.md#else-directive) [语句集](./05_Statements.md#statements)<sub>可选</sub>
>
> _if 指令_ → **#if**
>
> _elseif 指令_ → **#elseif**
>
> _else 指令_ → **#else**
>
> _endif 指令_ → **#endif**
>
> _编译条件_ → [平台条件](./05_Statements.md#platform-condition)
>
> _编译条件_ → [标识符](./02_Lexical_Structure.md#identifier)
>
> _编译条件_ → [布尔字面量](./02_Lexical_Structure.md#boolean-literal)
>
> _编译条件_ → **(** [编译条件](./05_Statements.md#compilation-condition) **)**
>
> _编译条件_ → **!** [编译条件](./05_Statements.md#compilation-condition)
>
> _编译条件_ → [编译条件](./05_Statements.md#compilation-condition) **&&** [编译条件](./05_Statements.md#compilation-condition)
>
> _编译条件_ → [编译条件](./05_Statements.md#compilation-condition) **||** [编译条件](./05_Statements.md#compilation-condition)
>
> _平台条件_ → **os** **(** [操作系统](./05_Statements.md#operating-system) **)**
>
> _平台条件_ → **arch** **(** [架构](./05_Statements.md#architecture) **)**
>
> _平台条件_ → **swift** **(** **>=** [swift 版本](./05_Statements.md#swift-version) **)** | **swift** **(** **<** [swift 版本](./05_Statements.md#swift-version) **)**
>
> _平台条件_ → **compiler** **(** **>=** [swift 版本](./05_Statements.md#swift-version) **)** | **compiler** **(** **<** [swift 版本](./05_Statements.md#swift-version) **)**
>
> _平台条件_ → **canImport** **(** [模块名](./05_Statements.md#module-name) **)**
>
> _平台条件_ → **targetEnvironment** **(** [环境](./05_Statements.md#environment) **)**
>
> _操作系统_ → **macOS** | **iOS** | **watchOS** | **tvOS**
>
> _架构_ → **i386** | **x86_64** | **arm** | **arm64**
>
> _swift 版本_ → [十进制数字集](./02_Lexical_Structure.md#decimal-digits) [swift 版本后缀](./05_Statements.md#swift-version-continuation)<sub>可选</sub>
>
> _swift 版本后缀_ → **.** [十进制数字集](./02_Lexical_Structure.md#decimal-digits) [swift 版本集](./05_Statements.md#swift-version-continuation)<sub>可选</sub>
>
> _模块名_ → [标识符](./02_Lexical_Structure.md#identifier)
>
> _环境_ → **模拟器** ｜ **macCatalyst**

<!-- -->

> 行控制语句语法
>
> _行控制语句_ → **#sourceLocation** **(** **file:** [文件名](./05_Statements.md#file-name) **,** **line:** [行号](./05_Statements.md#line-number) **)**
>
> _行控制语句_ → **#sourceLocation** **(** **)**
>
> _行号_ → 一个大于 0 的十进制数字
>
> _文件名_ → [静态字符串字面量](./02_Lexical_Structure.md#static-string-literal)

<!-- -->

> 编译期诊断语句语法
>
> _诊断语句_ → **#error** **(** [诊断信息](./05_Statements.md#diagnostic-message) **)**
>
> _诊断语句_ → **#warning** **(** [诊断信息](./05_Statements.md#diagnostic-message) **)**
>
> _诊断信息_ → [静态字符串字面量](./02_Lexical_Structure.md#static-string-literal)

<!-- -->

> 可用性条件语法
>
> _可用性条件_ → **#available** **(** [可用性参数集](./05_Statements.md#availability-arguments) **)**
>
> _可用性参数集_ → [可用性参数](./05_Statements.md#availability-argument) | [可用性参数](./05_Statements.md#availability-argument) , [可用性参数集）](./05_Statements.md#availability-arguments)
>
> _可用性参数_ → [平台名](./05_Statements.md#platform-name) [平台版本](./05_Statements.md#platform-version)
>
> _可用性参数_ → **\***
>
> _平台名_ → **iOS** | **iOSApplicationExtension**
>
> _平台名_ → **macOS** | **macOSApplicationExtension**
>
> _平台名_ → **watchOS**
>
> _平台名_ → **tvOS**
>
> _平台版本_ → [十进制数字集](./02_Lexical_Structure.md#decimal-digits)
>
> _平台版本_ → [十进制数字集](./02_Lexical_Structure.md#decimal-digits) **.** [十进制数字集](./02_Lexical_Structure.md#decimal-digits)
>
> _平台版本_ → [十进制数字集](./02_Lexical_Structure.md#decimal-digits) **.** [十进制数字集](./02_Lexical_Structure.md#decimal-digits) **.** [十进制数字集](./02_Lexical_Structure.md#decimal-digits)

## 声明

> 声明语法
>
> _声明_ → [导入声明](./06_Declarations.md#import-declaration)
>
> _声明_ → [常量声明](./06_Declarations.md#constant-declaration)
>
> _声明_ → [变量声明](./06_Declarations.md#variable-declaration)
>
> _声明_ → [类型别名声明](./06_Declarations.md#typealias-declaration)
>
> _声明_ → [函数声明](./06_Declarations.md#function-declaration)
>
> _声明_ → [枚举声明](./06_Declarations.md#enum-declaration)
>
> _声明_ → [结构体声明](./06_Declarations.md#struct-declaration)
>
> _声明_ → [类声明](./06_Declarations.md#class-declaration)
>
> _声明_ → [协议声明](./06_Declarations.md#protocol-declaration)
>
> _声明_ → [构造器声明](./06_Declarations.md#initializer-declaration)
>
> _声明_ → [析构器声明](./06_Declarations.md#deinitializer-declaration)
>
> _声明_ → [扩展声明](./06_Declarations.md#extension-declaration)
>
> _声明_ → [下标声明](./06_Declarations.md#subscript-declaration)
>
> _声明_ → [运算符声明](./06_Declarations.md#operator-declaration)
>
> _声明_ → [优先级组声明](./06_Declarations.md#precedence-group-declaration)
>
> _声明集_ → [声明](./06_Declarations.md#declaration) [声明集](./06_Declarations.md#declarations)<sub>可选</sub>

<!-- -->

> 顶级声明语法
>
> _顶级声明_ → [多条语句](./05_Statements.md#statements)<sub>可选</sub>

<!-- -->

> 代码块语法
>
> _代码块_ → **{** [多条语句](./05_Statements.md#statements)<sub>可选</sub> **}**

<!-- -->

> 导入声明语法
>
> _导入声明_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> **import** [导入类型](./06_Declarations.md#import-kind)<sub>可选</sub> [导入路径](./06_Declarations.md#import-path)
>
> _导入类型_ → **typealias** | **struct** | **class** | **enum** | **protocol** | **let** | **var** | **func**
>
> _导入路径_ → [导入路径标识符](./06_Declarations.md#import-path-identifier) | [导入路径标识符](./06_Declarations.md#import-path-identifier) **.** [导入路径](./06_Declarations.md#import-path)
>
> _导入路径标识符_ → [标识符](./02_Lexical_Structure.md#identifier) | [运算符](./02_Lexical_Structure.md#operator)

<!-- -->

> 常数声明语法
>
> _常量声明_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [声明修饰符集](./06_Declarations.md#declaration-specifiers)<sub>可选</sub> **let** [模式构造器集](./06_Declarations.md#pattern-initializer-list)
>
> _模式构造器集_ → [模式构造器](./06_Declarations.md#pattern-initializer) | [模式构造器](./06_Declarations.md#pattern-initializer) **,** [模式构造器集](./06_Declarations.md#pattern-initializer-list)
>
> _模式构造器_ → [模式](./08_Patterns.md#pattern) [构造器](./06_Declarations.md#initializer)<sub>可选</sub>
>
> _构造器_ → **=** [表达式](./04_Expressions.md#expression)

<!-- -->

> 变量声明语法
>
> _变量声明_ → [变量声明头](./06_Declarations.md#variable-declaration-head) [模式构造器集](./06_Declarations.md#pattern-initializer-list)
>
> _变量声明_ → [变量声明头](./06_Declarations.md#variable-declaration-head) [变量名](./06_Declarations.md#variable-name) [类型注解](./03_Types.md#type-annotation) [代码块](./06_Declarations.md#code-block)
>
> _变量声明_ → [变量声明头](./06_Declarations.md#variable-declaration-head) [变量名](./06_Declarations.md#variable-name) [类型注解](./03_Types.md#type-annotation) [getter-setter 块](./06_Declarations.md#getter-setter-block)
>
> _变量声明_ → [变量声明头](./06_Declarations.md#variable-declaration-head) [变量名](./06_Declarations.md#variable-name) [类型注解](./03_Types.md#type-annotation) [getter-setter 关键字块](./06_Declarations.md#getter-setter-keyword-block)
>
> _变量声明_ → [变量声明头](./06_Declarations.md#variable-declaration-head) [变量名](./06_Declarations.md#variable-name) [构造器](./06_Declarations.md#initializer)<sub>可选</sub> [willSet-didSet 代码块](./06_Declarations.md#willSet-didSet-block)
>
> _变量声明_ → [变量声明头](./06_Declarations.md#variable-declaration-head) [变量名](./06_Declarations.md#variable-name) [类型注解](./03_Types.md#type-annotation) [构造器](./06_Declarations.md#initializer)<sub>可选</sub> [willSet-didSet 代码块](./06_Declarations.md#willSet-didSet-block)
>
> _变量声明头_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [声明修饰符集](./06_Declarations.md#declaration-specifiers)<sub>可选</sub> **var**
>
> _变量名称_ → [标识符](./02_Lexical_Structure.md#identifier)
>
> _getter-setter 块_ → [代码块](./06_Declarations.md#code-block)
>
> _getter-setter 块_ → **{** [getter 子句](./06_Declarations.md#getter-keyword-clause) [setter 子句](./06_Declarations.md#setter-keyword-clause)<sub>可选</sub> **}**
>
> _getter-setter 块_ → **{** [setter 子句](./06_Declarations.md#setter-keyword-clause) [getter 子句](./06_Declarations.md#getter-keyword-clause) **}**
>
> _getter 子句_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [可变性修饰符](./06_Declarations.md#mutation-modifier)<sub>可选</sub> **get** [代码块](./06_Declarations.md#code-block)
>
> _setter 子句_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [可变性修饰符](./06_Declarations.md#mutation-modifier)<sub>可选</sub> **set** [setter 名称](./06_Declarations.md#setter-name)<sub>可选</sub> [代码块](./06_Declarations.md#code-block)
>
> _setter 名称_ → **(** [标识符](./02_Lexical_Structure.md#identifier) **)**
>
> _getter-setter 关键字（Keyword）块_ → **{** [getter 关键字子句](./06_Declarations.md#getter-keyword-clause) [setter 关键字子句](./06_Declarations.md#setter-keyword-clause)<sub>可选</sub> **}**
>
> _getter-setter 关键字（Keyword）块_ → **{** [setter 关键字子句](./06_Declarations.md#setter-keyword-clause) [getter 关键字子句](./06_Declarations.md#getter-keyword-clause) **}**
>
> _getter 关键字（Keyword）子句_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [可变性修饰符](./06_Declarations.md#mutation-modifier)<sub>可选</sub> **get**
>
> _setter 关键字（Keyword）子句_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [可变性修饰符](./06_Declarations.md#mutation-modifier)<sub>可选</sub> **set**
>
> _willSet-didSet 代码块_ → **{** [willSet 子句](./06_Declarations.md#willSet-clause) [didSet 子句](./06_Declarations.md#didSet-clause)<sub>可选</sub> **}**
>
> _willSet-didSet 代码块_ → **{** [didSet 子句](./06_Declarations.md#didSet-clause) [willSet 子句](./06_Declarations.md#willSet-clause)<sub>可选</sub> **}**
>
> _willSet 子句_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> **willSet** [setter 名称](./06_Declarations.md#setter-name)<sub>可选</sub> [代码块](./06_Declarations.md#code-block)
>
> _didSet 子句_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub>
>
> **didSet** [setter 名称](./06_Declarations.md#setter-name)<sub>可选</sub> [代码块](./06_Declarations.md#code-block)

<!-- -->

> 类型别名声明语法
>
> _类型别名声明_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [访问级别修饰符](./07_Attributes.md#access-level-modifier) **typealias** [类型别名名称](./06_Declarations.md#typealias-name) [泛型参数子句](./09_Generic_Parameters_and_Arguments.md#generic-parameter-clause)<sub>可选</sub> [类型别名赋值](./06_Declarations.md#typealias-assignment)
>
> _类型别名名称_ → [标识符](./02_Lexical_Structure.md#identifier)
>
> _类型别名赋值_ → **=** [类型](./03_Types.md#type)

<!-- -->

> 函数声明语法
>
> _函数声明_ → [函数头](./06_Declarations.md#function-head) [函数名](./06_Declarations.md#function-name) [泛型参数子句](./09_Generic_Parameters_and_Arguments.md#generic-parameter-clause)<sub>可选</sub> [函数签名](./06_Declarations.md#function-signature) [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub> [函数体](./06_Declarations.md#function-body)<sub>可选</sub>
>
> _函数头_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [声明描述符集](./06_Declarations.md#declaration-specifiers)<sub>可选</sub> **func**
>
> _函数名_ → [标识符](./02_Lexical_Structure.md#identifier) | [运算符](./02_Lexical_Structure.md#operator)
>
> _函数签名_ → [参数子句](./06_Declarations.md#parameter-clause) **throws**<sub>可选</sub> [函数结果](./06_Declarations.md#function-result)<sub>可选</sub>

> _函数签名_ → [参数子句](./06_Declarations.md#parameter-clause) **rethrows** [函数结果](./06_Declarations.md#function-result)<sub>可选</sub>
>
> _函数结果_ → **->** [特性](./07_Attributes.md#attributes)<sub>可选</sub> [类型](./03_Types.md#type)
>
> _函数体_ → [代码块](./06_Declarations.md#code-block)
>
> _参数子句_ → **(** **)** | **(** [参数集](./06_Declarations.md#parameter-list) **)**
>
> _参数集_ → [参数](./06_Declarations.md#parameter) | [参数](./06_Declarations.md#parameter) **,** [参数集](./06_Declarations.md#parameter-list)
>
> _参数_ → [外部参数名](./06_Declarations.md#parameter-name)<sub>可选</sub> [本地参数名](./06_Declarations.md#local-parameter-name) [类型注解](./03_Types.md#type-annotation) [默认参数子句](./06_Declarations.md#default-argument-clause)<sub>可选</sub>
>
> _参数_ → [外部参数名](./06_Declarations.md#parameter-name)<sub>可选</sub> [本地参数名](./06_Declarations.md#local-parameter-name) [类型注解](./03_Types.md#type-annotation)
>
> _参数_ → [外部参数名](./06_Declarations.md#parameter-name)<sub>可选</sub> [本地参数名](./06_Declarations.md#local-parameter-name) [类型注解](./03_Types.md#type-annotation) **...**
>
> _外部参数名_ → [标识符](./02_Lexical_Structure.md#identifier)
>
> _本地参数名_ → [标识符](./02_Lexical_Structure.md#identifier)
>
> _默认参数子句_ → **=** [表达式](./04_Expressions.md#expression)

<!-- -->

> 枚举声明语法
>
> _枚举声明_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [访问级别修饰符](./07_Attributes.md#access-level-modifier)<sub>可选</sub> [联合式枚举](./06_Declarations.md#union-style-enum)
>
> _枚举声明_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [访问级别修饰符](./07_Attributes.md#access-level-modifier)<sub>可选</sub> [原始值式枚举](./06_Declarations.md#raw-value-style-enum)
>
> _联合式枚举_ → **indirect**<sub>可选</sub> **enum** [枚举名](./06_Declarations.md#enum-name) [泛型参数子句](./09_Generic_Parameters_and_Arguments.md#generic-parameter-clause)<sub>可选</sub> [类型继承子句](./03_Types.md#type-inheritance-clause)<sub>可选</sub> [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub> **{** [联合式枚举成员](./06_Declarations.md#union-style-enum-members)<sub>可选</sub> **}**
>
> _联合式枚举成员集_ → [联合式枚举成员](./06_Declarations.md#union-style-enum-member) [联合样式枚举成员集](./06_Declarations.md#union-style-enum-members)<sub>可选</sub>
>
> _联合样式枚举成员_ → [声明](./06_Declarations.md#declaration) | [联合式枚举 case 子句](./06_Declarations.md#union-style-enum-case-clause) | [编译控制语句](./05_Statements.md#compiler-control-statement)
>
> _联合式枚举 case 子句_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> **indirect**<sub>可选</sub> **case** [联合式枚举 case 集](./06_Declarations.md#union-style-enum-case-list)
>
> _联合式枚举 case 集_ → [联合式枚举 case](./06_Declarations.md#union-style-enum-case) | [联合式枚举 case](./06_Declarations.md#union-style-enum-case) **,** [联合式枚举 case 集](./06_Declarations.md#union-style-enum-case-list)
>
> _联合式枚举 case_ → [枚举的 case 名](./06_Declarations.md#enum-case-name) [元组类型](./03_Types.md#tuple-type)<sub>可选</sub>
>
> _枚举名_ → [标识符](./02_Lexical_Structure.md#identifier)
>
> _枚举的 case 名_ → [标识符](./02_Lexical_Structure.md#identifier)
>
> _原始值式枚举_ → **enum** [枚举名](./06_Declarations.md#enum-name) [泛型参数子句](./09_Generic_Parameters_and_Arguments.md#generic-parameter-clause)<sub>可选</sub> [类型继承子句](./03_Types.md#type-inheritance-clause) [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub> **{** [原始值式枚举成员集](./06_Declarations.md#raw-value-style-enum-members) **}**
>
> _原始值式枚举成员集_ → [原始值式枚举成员](./06_Declarations.md#raw-value-style-enum-member) [原始值式枚举成员集](./06_Declarations.md#raw-value-style-enum-members)<sub>可选</sub>
>
> _原始值式枚举成员_ → [声明](./06_Declarations.md#declaration) | [原始值式枚举 case 子句](./06_Declarations.md#raw-value-style-enum-case-clause) | [编译控制语句](./05_Statements.md#compiler-control-statement)
>
> _原始值式枚举 case 子句_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> **case** [原始值式枚举 case 集](./06_Declarations.md#raw-value-style-enum-case-list)
>
> _原始值式枚举 case 集_ → [原始值式枚举 case](./06_Declarations.md#raw-value-style-enum-case) | [原始值式枚举 case](./06_Declarations.md#raw-value-style-enum-case) **,** [原始值式枚举 case 集](./06_Declarations.md#raw-value-style-enum-case-list)
>
> _原始值式枚举 case_ → [枚举的 case 名](./06_Declarations.md#enum-case-name) [原始值赋值](./06_Declarations.md#raw-value-assignment)<sub>可选</sub>
>
> _原始值赋值_ → **=** [原始值字面量](./02_Lexical_Structure.md#literal)
>
> _原始值字面量（raw-value-literal）_ → [数值字面量](./02_Lexical_Structure.md#literal) | [静态字符串字面量](./02_Lexical_Structure.md#literal) | [布尔字面量](./02_Lexical_Structure.md#literal)

<!-- -->

> 结构体声明语法
>
> _结构体声明_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [访问级别修饰符](./07_Attributes.md#access-level-modifier)<sub>可选</sub> **struct** [结构体名称](./06_Declarations.md#struct-name) [泛型参数子句](./09_Generic_Parameters_and_Arguments.md#generic-parameter-clause)<sub>可选</sub> [类型继承子句](./03_Types.md#type-inheritance-clause)<sub>可选</sub> [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub> [结构体主体](./06_Declarations.md#struct-body)
>
> _结构体名称_ → [标识符](./02_Lexical_Structure.md#identifier)
>
> _结构体主体_ → **{** [结构体成员集](./06_Declarations.md#declarations)<sub>可选</sub> **}**
>
> _结构体成员集_ → [结构体成员](./06_Declarations.md#declarations) [结构体成员集](./06_Declarations.md#declarations)<sub>可选</sub>
>
> _结构体成员_ → [声明集](./06_Declarations.md#declarations) | [编译控制语句](./05_Statements.md#compiler-control-statement)

<!-- -->

> 类声明语法
>
> _类声明_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [访问级别修饰符](./07_Attributes.md#access-level-modifier)<sub>可选</sub> **final**<sub>可选</sub> **class** [类名](./06_Declarations.md#class-name) [泛型参数子句](./09_Generic_Parameters_and_Arguments.md#generic-parameter-clause)<sub>可选</sub> [类型继承子句](./03_Types.md#type-inheritance-clause) [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub> [类主体](./06_Declarations.md#class-body)
>
> _类声明_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> **final** [访问级别修饰符](./07_Attributes.md#access-level-modifier)<sub>可选</sub> **class** [类名](./06_Declarations.md#class-name) [泛型参数子句](./09_Generic_Parameters_and_Arguments.md#generic-parameter-clause)<sub>可选</sub> [类型继承子句](./03_Types.md#type-inheritance-clause) [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub> [类主体](./06_Declarations.md#class-body)
>
> _类名_ → [标识符](./02_Lexical_Structure.md#identifier)
>
> _类主体_ → **{** [类成员集](./06_Declarations.md#declarations)<sub>可选</sub> **}**
>
> _类成员集_ → [类成员](./06_Declarations.md#declarations) [类成员集](./06_Declarations.md#declarations)<sub>可选</sub>
>
> _类成员_ → [声明集](./06_Declarations.md#declarations) | [编译控制语句](./05_Statements.md#compiler-control-statement)

<!-- -->

> 协议声明语法
>
> _协议声明_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [访问级别修饰符](./07_Attributes.md#access-level-modifier)<sub>可选</sub> **protocol** [协议名](./06_Declarations.md#protocol-name) [类型继承子句](./03_Types.md#type-inheritance-clause)<sub>可选</sub> [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub> [协议主体](./06_Declarations.md#protocol-body)
>
> _协议名_ → [标识符](./02_Lexical_Structure.md#identifier)
>
> _协议主体_ → **{** [协议成员集](./06_Declarations.md#protocol-member-declarations)<sub>可选</sub> **}**
>
> _协议成员集_ → [协议成员](./06_Declarations.md#declarations) [协议成员集](./06_Declarations.md#declarations)<sub>可选</sub>
>
> _协议成员_ → [协议成员声明](./06_Declarations.md#declarations) | [编译控制语句](./05_Statements.md#compiler-control-statement)
>
> _协议成员声明_ → [协议属性声明](./06_Declarations.md#protocol-property-declaration)
>
> _协议成员声明_ → [协议方法声明](./06_Declarations.md#protocol-method-declaration)
>
> _协议成员声明_ → [协议构造器声明](./06_Declarations.md#protocol-initializer-declaration)
>
> _协议成员声明_ → [协议下标声明](./06_Declarations.md#protocol-subscript-declaration)
>
> _协议成员声明_ → [协议关联类型声明](./06_Declarations.md#protocol-associated-type-declaration)
>
> _协议成员声明_ → [类型别名声明](./06_Declarations.md#typealias-declaration)

<!-- -->

> 协议属性声明语法
>
> _协议属性声明_ → [变量声明头](./06_Declarations.md#variable-declaration-head) [变量名](./06_Declarations.md#variable-name) [类型注解](./03_Types.md#type-annotation) [getter-setter 关键字块](./06_Declarations.md#getter-setter-keyword-block)

<!-- -->

> 协议方法声明语法
>
> _协议方法声明_ → [函数头](./06_Declarations.md#function-head) [函数名](./06_Declarations.md#function-name) [泛型参数子句](./09_Generic_Parameters_and_Arguments.md#generic-parameter-clause)<sub>可选</sub> [函数签名](./06_Declarations.md#function-signature) [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub>

<!-- -->

> 协议构造器声明语法
>
> _协议构造器声明_ → [构造器头](./06_Declarations.md#initializer-head) [泛型参数子句](./09_Generic_Parameters_and_Arguments.md#generic-parameter-clause)<sub>可选</sub> [参数子句](./06_Declarations.md#parameter-clause) **throws**<sub>可选</sub> [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub>
>
> _协议构造器声明_ → [构造器头](./06_Declarations.md#initializer-head) [泛型参数子句](./09_Generic_Parameters_and_Arguments.md#generic-parameter-clause)<sub>可选</sub> [参数子句](./06_Declarations.md#parameter-clause) **rethrows** [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub>

<!-- -->

> 协议下标声明语法
>
> _协议下标声明_ → [下标头](./06_Declarations.md#subscript-head) [下标结果](./06_Declarations.md#subscript-result) [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub> [getter-setter 关键字块](./06_Declarations.md#getter-setter-keyword-block)

<!-- -->

> 协议关联类型声明语法
>
> _协议关联类型声明_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [访问级别修饰符](./07_Attributes.md#access-level-modifier)<sub>可选</sub> **associatedtype** [类型别名](./06_Declarations.md#typealias-name) [类型继承子句](./03_Types.md#type-inheritance-clause)<sub>可选</sub> [类型别名赋值](./06_Declarations.md#typealias-assignment)<sub>可选</sub> [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub>

<!-- -->

> 构造器声明语法
>
> _构造器声明_ → [构造器头](./06_Declarations.md#initializer-head) [泛型参数子句](./09_Generic_Parameters_and_Arguments.md#generic-parameter-clause)<sub>可选</sub> [参数子句](./06_Declarations.md#parameter-clause) **throws**<sub>可选</sub> [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub> [构造器主体](./06_Declarations.md#initializer-body)
>
> _构造器声明_ → [构造器头](./06_Declarations.md#initializer-head) [泛型参数子句](./09_Generic_Parameters_and_Arguments.md#generic-parameter-clause)<sub>可选</sub> [参数子句](./06_Declarations.md#parameter-clause) **rethrows** [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub> [构造器主体](./06_Declarations.md#initializer-body)
>
> _构造器头（Head）_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [声明修饰符集](./06_Declarations.md#declaration-modifiers)<sub>可选</sub> **init**
>
> _构造器头（Head）_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [声明修饰符集](./06_Declarations.md#declaration-modifiers)<sub>可选</sub> **init ?**
>
> _构造器头（Head）_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [声明修饰符集](./06_Declarations.md#declaration-modifiers)<sub>可选</sub> **init !**
>
> _构造器主体_ → [代码块](./06_Declarations.md#code-block)

<!-- -->

> 析构器声明语法
>
> _析构器声明_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> **deinit** [代码块](./06_Declarations.md#code-block)

<!-- -->

> 扩展声明语法
>
> _扩展声明_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [访问级别修饰符](./07_Attributes.md#access-level-modifier)<sub>可选</sub> **extension** [类型标识](./03_Types.md#type-identifier) [类型继承子句](./03_Types.md#type-inheritance-clause)<sub>可选</sub> [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub> [扩展主体](./06_Declarations.md#extension-body)
>
> _扩展主体_ → **{** [扩展成员集](./06_Declarations.md#declarations)<sub>可选</sub> **}**
>
> _扩展成员集_ → [扩展成员](./06_Declarations.md#declarations) [扩展成员集](./06_Declarations.md#declarations)<sub>可选</sub>
>
> _扩展成员_ → [声明集](./06_Declarations.md#declarations) | [编译控制语句](./05_Statements.md#compiler-control-statement)

<!-- -->

> 下标声明语法
>
> _下标声明_ → [下标头](./06_Declarations.md#subscript-head) [下标结果](./06_Declarations.md#subscript-result) [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub> [代码块](./06_Declarations.md#code-block)
>
> _下标声明_ → [下标头](./06_Declarations.md#subscript-head) [下标结果](./06_Declarations.md#subscript-result) [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub> [getter-setter 块](./06_Declarations.md#getter-setter-block)
>
> _下标声明_ → [下标头](./06_Declarations.md#subscript-head) [下标结果](./06_Declarations.md#subscript-result) [泛型 where 子句](./09_Generic_Parameters_and_Arguments.md#generic-where-clause)<sub>可选</sub> [getter-setter 关键字块](./06_Declarations.md#getter-setter-keyword-block)
>
> _下标头（Head）_ → [特性](./07_Attributes.md#attributes)<sub>可选</sub> [声明修饰符集](./06_Declarations.md#declaration-modifiers)<sub>可选</sub> **subscript** [泛型参数子句](./09_Generic_Parameters_and_Arguments.md#generic-parameter-clause)<sub>可选</sub> [参数子句](./06_Declarations.md#parameter-clause)
>
> _下标结果（Result）_ → **->** [特性](./07_Attributes.md#attributes)<sub>可选</sub> [类型](./03_Types.md#type)

<!-- -->

> 运算符声明语法
>
> _运算符声明_ → [前置运算符声明](./06_Declarations.md#prefix-operator-declaration) | [后置运算符声明](./06_Declarations.md#postfix-operator-declaration) | [中置运算符声明](./06_Declarations.md#infix-operator-declaration)
>
> _前置运算符声明_ → **prefix** **operator** [运算符](./02_Lexical_Structure.md#operator)
>
> _后置运算符声明_ → **postfix** **operator** [运算符](./02_Lexical_Structure.md#operator)
>
> _中置运算符声明_ → **infix** **operator** [运算符](./02_Lexical_Structure.md#operator) [中置运算符特性](./06_Declarations.md#infix-operator-attributes)<sub>可选</sub>
>
> _中置运算符特性_ → [优先级组名](./06_Declarations.md#precedence-group-name)

> 优先级组声明语法
>
> _优先级组声明_ → **precedencegroup** [优先级组名](./06_Declarations.md#precedence-group-name) **{** [优先级组特性](./06_Declarations.md#precedence-group-attributes)<sub>可选</sub> **}**
>
> _优先级组特性_ → [优先级组属性](./06_Declarations.md#declarations) [优先级组特性](./06_Declarations.md#declarations)<sub>可选</sub>
>
> _优先级组属性_ → [优先级组关系](./06_Declarations.md#declarations)
>
> _优先级组属性_ → [优先级组赋值](./06_Declarations.md#declarations)
>
> _优先级组属性_ → [优先级组结合](./06_Declarations.md#declarations)
>
> _优先级组关系_ → **higherThan :** [优先级组名集](./06_Declarations.md#declarations)
>
> _优先级组关系_ → **lowerThan :** [优先级组名集](./06_Declarations.md#declarations)
>
> _优先级组赋值_ → **assignment :** [布尔字面量](./02_Lexical_Structure.md#string-literal)
>
> _优先级组结合_ → **associativity : left**
>
> _优先级组结合_ → **associativity : right**
>
> _优先级组结合_ → **associativity : none**
>
> _优先级组名集_ → [优先级组名](./06_Declarations.md#declarations) | [优先级组名](./06_Declarations.md#declarations) **,** [优先级组名集](./06_Declarations.md#declarations)
>
> _优先级组名_ → [标识符](./02_Lexical_Structure.md#identifier)

<!-- -->

> 声明修饰符语法
>
> _声明修饰符_ → **class** | **convenience** | **dynamic** | **final** | **infix** | **lazy** | **optional** | **override** | **postfix** | **prefix** | **required** | **static** | **unowned** | **unowned(safe)** | **unowned(unsafe)** | **weak**
>
> _声明修饰符_ → [访问级别修饰符](./07_Attributes.md#access-level-modifier)
>
> _声明修饰符_ → [可变性修饰符](./07_Attributes.md#mutation-modifier)
>
> _声明修饰符集_ → [声明修饰符](./06_Declarations.md#declaration-modifier) [声明修饰符集](./06_Declarations.md#declaration-modifiers)<sub>可选</sub>
>
> _访问级别修饰符_ → **private** | **private(set)**
>
> _访问级别修饰符_ → **fileprivate** | **fileprivate(set)**
>
> _访问级别修饰符_ → **internal** | **internal(set)**
>
> _访问级别修饰符_ → **public** | **public(set)**
>
> _访问级别修饰符_ → **open** | **open(set)**
>
> _可变性修饰符_ → **mutating** | **nonmutating**

## 属性

> 属性语法
>
> _属性_ → **@** [属性名](./07_Attributes.md#attribute-name) [属性参数子句](./07_Attributes.md#attribute-argument-clause)<sub>可选</sub>
>
> _属性名_ → [标识符](./02_Lexical_Structure.md#identifier)
>
> _属性参数子句_ → **{** [平衡令牌集](./07_Attributes.md#balanced-tokens)<sub>可选</sub> **}**
>
> _属性（Attributes）集_ → [属性](./07_Attributes.md#attribute) [特性](./07_Attributes.md#attributes)<sub>可选</sub>
>
> _平衡令牌集_ → [平衡令牌](./07_Attributes.md#balanced-token) [平衡令牌集](./07_Attributes.md#balanced-tokens)<sub>可选</sub>
>
> _平衡令牌_ → **(** [平衡令牌集](./07_Attributes.md#balanced-tokens)<sub>可选</sub> **)**
>
> _平衡令牌_ → **[** [平衡令牌集](./07_Attributes.md#balanced-tokens)<sub>可选</sub> **]**
>
> _平衡令牌_ → **{** [平衡令牌集](./07_Attributes.md#balanced-tokens)<sub>可选</sub> **}**
>
> _平衡令牌_ → 任意标识符、关键字、字面量或运算符
>
> _平衡令牌_ → 除 **(** 、**)**、**[**、**]**、**{**、**}** 外的任意标点符号

## 模式

> 模式语法
>
> _模式_ → [通配符模式](./08_Patterns.md#wildcard-pattern) [类型注解](./03_Types.md#type-annotation)<sub>可选</sub>
>
> _模式_ → [标识符模式](./08_Patterns.md#identifier-pattern) [类型注解](./03_Types.md#type-annotati Value Bindingon )<sub>可选</sub>
>
> _模式_ → [值绑定模式](./08_Patterns.md#value-binding-pattern)
>
> _模式_ → [元组模式](./08_Patterns.md#tuple-pattern) [类型注解](./03_Types.md#type-annotation)<sub>可选</sub>
>
> _模式_ → [枚举 case 模式](./08_Patterns.md#enum-case-pattern)
>
> _模式_ → [可选模式](./08_Patterns.md#optional-pattern)
>
> _模式_ → [类型转换模式](./08_Patterns.md#type-casting-pattern)
>
> _模式_ → [表达式模式](./08_Patterns.md#expression-pattern)

<!-- -->

> 通配符模式语法
>
> _通配符模式_ → **\_**

<!-- -->

> 标识符模式语法
>
> _标识符模式_ → [标识符](./02_Lexical_Structure.md#identifier)

<!-- -->

> 值绑定模式语法
>
> _值绑定模式_ → **var** [模式](./08_Patterns.md#pattern) | **let** [模式](./08_Patterns.md#pattern)

<!-- -->

> 元组模式语法
>
> _元组模式_ → **(** [元组模式元素集](./08_Patterns.md#tuple-pattern-element-list)<sub>可选</sub> **)**
>
> _元组模式元素集_ → [元组模式元素](./08_Patterns.md#tuple-pattern-element) | [元组模式元素](./08_Patterns.md#tuple-pattern-element) **,** [元组模式元素集](./08_Patterns.md#tuple-pattern-element-list)
>
> _元组模式元素_ → [模式](./08_Patterns.md#pattern) | [标识符](./02_Lexical_Structure.md#identifier) **:** [模式](./08_Patterns.md#pattern)

<!-- -->

> 枚举 case 模式语法
>
> _enum-case-pattern_ → [类型标识](./03_Types.md#type-identifier)<sub>可选</sub> **.** [枚举 case 名](./06_Declarations.md#enum-case-name) [元组模式](./08_Patterns.md#tuple-pattern)<sub>可选</sub>

<!-- -->

> 可选模式语法
>
> _可选模式_ → [标识符模式](./02_Lexical_Structure.md#identifier) **?**

<!-- -->

> 类型转换模式语法
>
> _类型转换模式_ → [is 模式](./08_Patterns.md#is-pattern) | [as 模式](./08_Patterns.md#as-pattern)
>
> _is 模式_ → **is** [类型](./03_Types.md#type)
>
> _as 模式_ → [模式](./08_Patterns.md#pattern) **as** [类型](./03_Types.md#type)

<!-- -->

> 表达式模式语法
>
> _表达式模式_ → [表达式](./04_Expressions.md#expression)

## 泛型参数

> 泛型形参子句语法
>
> _泛型参数子句_ → **<** [泛型参数集](./09_Generic_Parameters_and_Arguments.md#generic-parameter-list) **>**
>
> _泛型参数集_ → [泛型参数](./09_Generic_Parameters_and_Arguments.md#generic-parameter) | [泛形参数](./09_Generic_Parameters_and_Arguments.md#generic-parameter) **,** [泛型参数集](./09_Generic_Parameters_and_Arguments.md#generic-parameter-list)
>
> _泛形参数_ → [类型名称](./03_Types.md#type-name)
>
> _泛形参数_ → [类型名称](./03_Types.md#type-name) **:** [类型标识](./03_Types.md#type-identifier)
>
> _泛形参数_ → [类型名称](./03_Types.md#type-name) **:** [协议合成类型](./03_Types.md#protocol-composition-type)
>
> _泛型 where 子句_ → **where** [约束集](./09_Generic_Parameters_and_Arguments.md#requirement-list)
>
> _约束集_ → [约束](./09_Generic_Parameters_and_Arguments.md#requirement) | [约束](./09_Generic_Parameters_and_Arguments.md#requirement) **,** [约束集](./09_Generic_Parameters_and_Arguments.md#requirement-list)
>
> _约束_ → [一致性约束](./09_Generic_Parameters_and_Arguments.md#conformance-requirement) | [同类型约束](./09_Generic_Parameters_and_Arguments.md#same-type-requirement)
>
> _一致性约束_ → [类型标识](./03_Types.md#type-identifier) **:** [类型标识](./03_Types.md#type-identifier)
>
> _一致性约束_ → [类型标识](./03_Types.md#type-identifier) **:** [协议合成类型](./03_Types.md#protocol-composition-type)
>
> _同类型约束_ → [类型标识](./03_Types.md#type-identifier) **==** [类型](./03_Types.md#type-identifier)

<!-- -->

> 泛型实参子句语法
>
> _泛型实参子句_ → **<** [泛型实参集](./09_Generic_Parameters_and_Arguments.md#generic-argument-list) **>**
>
> _泛型实参集_ → [泛型实参](./09_Generic_Parameters_and_Arguments.md#generic-argument) | [泛形实参](./09_Generic_Parameters_and_Arguments.md#generic-argument) **,** [泛型实参集](./09_Generic_Parameters_and_Arguments.md#generic-argument-list)
>
> _泛形实参_ → [类型](./03_Types.md#type)
