//
//  TutorialConfig.swift
//  HelloSwift
//
//  Created by hx on 9/8/22.
//

import Foundation


struct LangSwift: Identifiable {
    let id = UUID()
    var nid: String
    var name: String
    var en: String
    var searchKeyword: String
}
var LangSwiftWelcomeList: [LangSwift] = [
    LangSwift(nid: "about-swift", name: "关于Swift", en: "about-swift", searchKeyword: ""),
    LangSwift(nid: "version-compatibility", name: "版本兼容说明", en: "version-compatibility", searchKeyword: ""),
    LangSwift(nid: "swift-tour", name: "初识Swift", en: "swift-tour", searchKeyword: "")
]

var LangSwiftSyntaxList: [LangSwift] = [
    LangSwift(nid: "the-basics", name: "基础", en: "Basics", searchKeyword: "let,var,变量,常量,print,打印,注释,整数,int,float,double,浮点数,类型转换,typealias,别名,布尔值,book,元组,可选项,nil,throws,do,try,catch,错误处理,断言,assert"),
    LangSwift(nid: "basic-operators", name: "基本运算符", en: "Operators", searchKeyword: "一元二元三元,赋值运算符,算术运算符+-*/,比较运算符>=<=!===,三元条件运算符?:,合并空值运算符?!,区间运算符...,逻辑与运算符&&||,与或非"),
    LangSwift(nid: "strings-and-characters", name: "字符串和字符", en: "String and Characters", searchKeyword: "unicode,字符串比较,字符串拼接,isEmpty,字符串初始化"),
    LangSwift(nid: "collection-types", name: "集合类型", en: "Collection Types", searchKeyword: ""),
    LangSwift(nid: "control-flow", name: "控制流", en: "Control Flow", searchKeyword: "for,if,else,repeat,while,switch,continue,break,fallthrough,#available,判断,假如,条件语句,循环"),
    LangSwift(nid: "functions", name: "函数", en: "Functions", searchKeyword: "func,return,参数,返回值,形参,调用函数"),
    LangSwift(nid: "closures", name: "闭包", en: "Closures", searchKeyword: "in"),
    LangSwift(nid: "enumerations", name: "枚举", en: "Enumerations", searchKeyword: "enum,遍历枚举,递归枚举,indirect"),
    LangSwift(nid: "classes-and-structures", name: "结构体和类", en: "Structures and Classes", searchKeyword: "struct,class,指针"),
    LangSwift(nid: "properties", name: "属性", en: "Properties", searchKeyword: "存储属性,计算属性,@propertyWrapper,属性包装,全局和局部变量,类型属性,get,set"),
    LangSwift(nid: "methods", name: "方法", en: "Methods", searchKeyword: ""),
    LangSwift(nid: "subscripts", name: "下标", en: "Subscripts", searchKeyword: ""),
    LangSwift(nid: "inheritance", name: "继承", en: "Inheritance", searchKeyword: "class,override重写,阻止重写"),
    LangSwift(nid: "initialization", name: "初始化", en: "Initialization", searchKeyword: ""),
    LangSwift(nid: "deinitialization", name: "反初始化", en: "Deinitialization", searchKeyword: ""),
    LangSwift(nid: "optional-chaining", name: "可选链", en: "Optional Chaining", searchKeyword: ""),
    LangSwift(nid: "error-handling", name: "错误处理", en: "Error Handling", searchKeyword: ""),
    LangSwift(nid: "concurrency", name: "并发", en: "Concurrency", searchKeyword: ""),
    LangSwift(nid: "type-casting", name: "类型转换", en: "Type Casting", searchKeyword: ""),
    LangSwift(nid: "nested-types", name: "内嵌类型", en: "Nested Types", searchKeyword: ""),
    LangSwift(nid: "extensions", name: "扩展", en: "Extensions", searchKeyword: ""),
    LangSwift(nid: "protocols", name: "协议", en: "Protocols", searchKeyword: ""),
    LangSwift(nid: "generics", name: "泛型", en: "Generics", searchKeyword: ""),
    LangSwift(nid: "opaquetypes", name: "不透明类型", en: "Opaquetypes", searchKeyword: ""),
    LangSwift(nid: "automatic-reference-counting", name: "自动引用计数", en: "Automatic Reference Counting", searchKeyword: ""),
    LangSwift(nid: "memory-safety", name: "内存安全性", en: "Memory Safety", searchKeyword: ""),
    LangSwift(nid: "access-control", name: "访问控制", en: "Access Control", searchKeyword: ""),
    LangSwift(nid: "advanced-operators", name: "高级运算符", en: "Advanced Operators", searchKeyword: "")
]
