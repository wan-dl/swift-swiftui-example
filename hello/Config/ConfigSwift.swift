//
//  TutorialConfig.swift
//  HelloSwift
//
//  Created by hx on 9/8/22.
//

import Foundation

/**
 * Swift 中文教程相关变量
 */
struct LangSwiftItem: Identifiable {
    let id = UUID()
    var ndir: String
    var nid: String
    var name: String
    var en: String
    var searchKeyword: String
}

var LangSwiftWelcomeList: [LangSwiftItem] = [
    LangSwiftItem(ndir: "welcome", nid: "about_swift", name: "关于Swift", en: "about-swift", searchKeyword: ""),
    LangSwiftItem(ndir: "welcome", nid: "version_compatibility", name: "版本兼容说明", en: "version-compatibility", searchKeyword: ""),
    LangSwiftItem(ndir: "welcome", nid: "a_swift_tour", name: "初识Swift", en: "swift-tour", searchKeyword: "")
]

let LangSwiftSyntaxList: [LangSwiftItem] = [
    LangSwiftItem(ndir: "guide", nid: "The_Basics", name: "基础", en: "Basics", searchKeyword: "let,var,变量,常量,print,打印,注释,整数,int,float,double,浮点数,类型转换,typealias,别名,布尔值,book,元组,可选项,nil,throws,do,try,catch,错误处理,断言,assert"),
    LangSwiftItem(ndir: "guide", nid: "Basic_Operators", name: "基本运算符", en: "Operators", searchKeyword: "一元二元三元,赋值运算符,算术运算符+-*/,比较运算符>=<=!===,三元条件运算符?:,合并空值运算符?!,区间运算符...,逻辑与运算符&&||,与或非"),
    LangSwiftItem(ndir: "guide", nid: "Strings_and_Characters", name: "字符串和字符", en: "String and Characters", searchKeyword: "unicode,字符串比较,字符串拼接,isEmpty,字符串初始化"),
    LangSwiftItem(ndir: "guide", nid: "Collection_Types", name: "集合类型", en: "Collection Types", searchKeyword: "数组Array,创建空数组,访问和修改数组,移除数组元素,遍历数组,集合Set,字典Dictionary,创建空字典,访问和修改字典,遍历字典"),
    LangSwiftItem(ndir: "guide", nid: "Control_Flow", name: "控制流", en: "Control Flow", searchKeyword: "for,if,else,repeat,while,switch,continue,break,fallthrough,#available,判断,假如,条件语句,循环"),
    LangSwiftItem(ndir: "guide", nid: "Functions", name: "函数", en: "Functions", searchKeyword: "func,return,参数,返回值,形参,调用函数"),
    LangSwiftItem(ndir: "guide", nid: "Closures", name: "闭包", en: "Closures", searchKeyword: "in,by,闭包表达式,尾随闭包,逃逸闭包,自动闭包"),
    LangSwiftItem(ndir: "guide", nid: "Enumerations", name: "枚举", en: "Enumerations", searchKeyword: "enum,遍历枚举,递归枚举,indirect"),
    LangSwiftItem(ndir: "guide", nid: "Structures_And_Classes", name: "结构体和类", en: "Structures and Classes", searchKeyword: "struct,class,指针"),
    LangSwiftItem(ndir: "guide", nid: "Properties", name: "属性", en: "Properties", searchKeyword: "存储属性,计算属性,@propertyWrapper,属性包装,全局和局部变量,类型属性,get,set"),
    LangSwiftItem(ndir: "guide", nid: "Methods", name: "方法", en: "Methods", searchKeyword: "实例方法,self属性,类型方法"),
    LangSwiftItem(ndir: "guide", nid: "Subscripts", name: "下标", en: "Subscripts", searchKeyword: "下标语法,下标用法,下标选项,类型下标"),
    LangSwiftItem(ndir: "guide", nid: "Inheritance", name: "继承", en: "Inheritance", searchKeyword: "class,override重写,阻止重写"),
    LangSwiftItem(ndir: "guide", nid: "Initialization", name: "初始化", en: "Initialization", searchKeyword: "自定义初始化,类的继承和初始化,安全检查"),
    LangSwiftItem(ndir: "guide", nid: "Deinitialization", name: "反初始化", en: "Deinitialization", searchKeyword: ""),
    LangSwiftItem(ndir: "guide", nid: "Optional_Chaining", name: "可选链", en: "Optional Chaining", searchKeyword: "nil,!.,?.,可选链访问下标,可选链调用方法"),
    LangSwiftItem(ndir: "guide", nid: "Error_Handling", name: "错误处理", en: "Error Handling", searchKeyword: "Error,try,catch,try!,throw,defer,指定清理操作"),
    LangSwiftItem(ndir: "guide", nid: "Concurrency", name: "并发", en: "Concurrency", searchKeyword: ""),
    LangSwiftItem(ndir: "guide", nid: "Type_Casting", name: "类型转换", en: "Type Casting", searchKeyword: "类型检查,向下类型转换,Any 和 AnyObject 的类型转换"),
    LangSwiftItem(ndir: "guide", nid: "Nested_Types", name: "内嵌类型", en: "Nested Types", searchKeyword: ""),
    LangSwiftItem(ndir: "guide", nid: "Extensions", name: "扩展", en: "Extensions", searchKeyword: ""),
    LangSwiftItem(ndir: "guide", nid: "Protocols", name: "协议", en: "Protocols", searchKeyword: "协议继承,协议扩展,协议组合"),
    LangSwiftItem(ndir: "guide", nid: "Generics", name: "泛型", en: "Generics", searchKeyword: "泛型类型,泛型函数,扩展一个泛型类型,类型约束,泛型Where分句,泛型下标,关联类型associatedtype,Container"),
    LangSwiftItem(ndir: "guide", nid: "Opaque_Types", name: "不透明类型", en: "Opaquetypes", searchKeyword: ""),
    LangSwiftItem(ndir: "guide", nid: "Automatic_Reference_Counting", name: "自动引用计数", en: "Automatic Reference Counting", searchKeyword: ""),
    LangSwiftItem(ndir: "guide", nid: "Memory_Safety", name: "内存安全性", en: "Memory Safety", searchKeyword: ""),
    LangSwiftItem(ndir: "guide", nid: "Access_Control", name: "访问控制", en: "Access Control", searchKeyword: "访问级别,open,internal,public,private,file-private"),
    LangSwiftItem(ndir: "guide", nid: "Advanced_Operators", name: "高级运算符", en: "Advanced Operators", searchKeyword: "~位运算符,&,位左移<<运算符,位右移运算符>>,溢出运算符&+,&-,&*,自定义运算符,限定符,operator,prefix,infix,postfix,结果建造器")
]


let LangSwiftReferenceList: [LangSwiftItem] = [
    LangSwiftItem(ndir: "reference", nid: "Lexical_Structure", name: "词法结构", en: "Lexical Structure", searchKeyword: ""),
    LangSwiftItem(ndir: "reference", nid: "Types", name: "类型", en: "Types", searchKeyword: ""),
    LangSwiftItem(ndir: "reference", nid: "Statements", name: "语句", en: "Statements", searchKeyword: ""),
    LangSwiftItem(ndir: "reference", nid: "Expressions", name: "表达式", en: "Expressions", searchKeyword: ""),
    LangSwiftItem(ndir: "reference", nid: "Declarations", name: "申明", en: "Declarations", searchKeyword: ""),
    LangSwiftItem(ndir: "reference", nid: "Attributes", name: "特性", en: "Attributes", searchKeyword: ""),
    LangSwiftItem(ndir: "reference", nid: "Patterns", name: "模式", en: "Patterns", searchKeyword: ""),
    LangSwiftItem(ndir: "reference", nid: "Generic_Parameters_and_Arguments", name: "泛型参数", en: "Generic Parameters and Arguments", searchKeyword: ""),
//    LangSwiftItem(ndir: "reference", nid: "Summary_of_the_Grammar", name: "语法总结", en: "Summary of the Grammar", searchKeyword: "")
]
