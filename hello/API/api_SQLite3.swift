//
//  api_sqlite3.swift
//  HelloSwift
//
//  Created by 1 on 8/15/22.
//

enum DB  {
    case SQLITE_OK         // 0 成功结果
    case SQLITE_ERROR      // 1 SQL错误或缺少数据库
    case SQLITE_INTERNAL   // 2 SQLite中的内部逻辑错误
    case SQLITE_PERM       // 3 访问权限被拒绝
    case SQLITE_ABORT      // 4 回调例程请求中止
    case SQLITE_BUSY       // 5 数据库文件已锁定
    case SQLITE_LOCKED     // 6 数据库中的一个表被锁定
    case SQLITE_NOMEM      // 7 一个malloc()失败
    case SQLITE_READONLY   // 8 尝试写入只读数据库
    case SQLITE_INTERRUPT  // 9 由sqlite3_interrupt()终止的操作
    case SQLITE_IOERR      // 10 发生某种磁盘I/O错误
    case SQLITE_CORRUPT    // 11 数据库磁盘映像格式不正确
    case SQLITE_NOTFOUND   // 12 未知操作码sqlite3_interrupt()
    case SQLITE_FULL       // 13 插入失败，因为数据库已满
    case SQLITE_CANTOPEN   // 14 无法打开数据库文件
    case SQLITE_PROTOCOL   // 15 数据库锁协议错误
    case SQLITE_EMPTY      // 16 数据库为空
    case SQLITE_SCHEMA     // 17 数据库架构已更改
    case SQLITE_TOOBIG     // 18 字符串或BLOB超出大小限制
    case SQLITE_CONSTRAINT // 19 由于约束冲突而中止
    case SQLITE_MISMATCH   // 20 数据类型不匹配
    case SQLITE_usage      // 21 库使用错误
    case SQLITE_NOLFS      // 22 使用主机不支持的操作系统功能
    case SQLITE_AUTH       // 23 授权被拒绝
    case SQLITE_FORMAT     // 24 辅助数据库格式错误
    case SQLITE_RANGE      // 25 第二个参数定义为sqlite3_bind超出范围
    case SQLITE_NOTADB     // 26 打开的不是数据库文件的文件
    case SQLITE_NOTICE     // 27 来自sqlite3_log()的通知
    case SQLITE_WARNING    // 28 来自sqlite3_log()的警告
    case SQLITE_ROW        // 100 sqlite3_step()已准备好另一行
    case SQLITE_DONE       // 101 sqlite3_step()已完成执行
}


import SwiftUI
import SQLite3

// 数据库
var db: OpaquePointer?

// 数据库名称
var dbName: String = "goods.sqlite"
var tableName: String = "GoodsList"

// 数据库路径
var dbPath: String = ""

let createTableString = """
CREATE TABLE GoodsList(
Id INT PRIMARY KEY NOT NULL,
Name CHAR(255));
"""
let insertStatementString = "INSERT INTO GoodsList (Id, Name) VALUES (?, ?);"
let queryStatementString = "select * from \(tableName)"
let updateStatementString = "UPDATE \(tableName) SET Name = '电脑' WHERE Id = 1;"
let deleteStatementString = "DELETE FROM \(tableName) WHERE Id = 1;"
let dropTableString = "DROP TABLE \(tableName);"


class Database {
    
    init() {
        // 初始化数据库路径信息
        if let libraryPathString = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first {
            let pathURL = URL(fileURLWithPath: libraryPathString).appendingPathComponent(dbName)
            dbPath = pathURL.absoluteString
        }
    }
    
    // 打开数据库
    func openDataBase() -> String {
        var message = ""
        guard dbPath != "" else { return "获取数据库路径失败" }
        
        if sqlite3_open(dbPath, &db) == SQLITE_OK {
            message = "数据库打开成功。数据库文件所在路径: \(dbPath)"
        } else {
            message = "数据库创建失败"
        }
        return message
    }
    
    // 创建表 GoodsList
    func createTable() -> String {
        var message = ""
        
        if db == nil {
            self.openDataBase()
        }
        var createStatement: OpaquePointer?
        let ret = sqlite3_prepare_v2(db, createTableString, -1, &createStatement, nil)
        if ret == SQLITE_OK {
            if sqlite3_step(createStatement) != SQLITE_DONE {
                message = "数据库表：创建失败"
            }
            sqlite3_finalize(createStatement)
            message =  "数据库表：创建成功 SQLITE_OK。"
        } else if ret == SQLITE_ERROR {
            message = "数据库表：创建失败 SQLITE_ERROR"
        } else {
            message = "数据库表：创建失败 \(ret)"
        }
        return message
    }
    
    // 删除表 GoodsList
    func dropTable() -> String {
        var message = ""
        
        if db == nil {
            self.openDataBase()
        }
        var dropStatement: OpaquePointer?
        let ret = sqlite3_prepare_v2(db, dropTableString, -1, &dropStatement, nil)
        if ret == SQLITE_OK {
            if sqlite3_step(dropStatement) != SQLITE_DONE {
                message = "数据库表：删除失败"
            }
            sqlite3_finalize(dropStatement)
            message =  "数据库表：删除成功 SQLITE_OK。"
        } else if ret == SQLITE_ERROR {
            message = "数据库表：删除失败 SQLITE_ERROR"
        } else {
            message = "数据库表：删除失败 \(ret)"
        }
        return message
    }
    
    // 插入数据
    func insert() -> String {
        var message = ""
        
        var insertStatement: OpaquePointer?
        let ret = sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil)

        if ret == SQLITE_OK {
            
            let id: Int32 = 1
            let name: NSString = "手机"
            
            sqlite3_bind_int(insertStatement, 1, id)
            sqlite3_bind_text(insertStatement, 2, name.utf8String, -1, nil)
            
            let insertResult = sqlite3_step(insertStatement)
            message = insertResult == 0 ? "数据插入成功 SQLITE_DONE" : "数据插入失败，原因：\(insertResult)"
        } else {
            message = "数据插入失败，原因：\(ret)"
        }
        sqlite3_finalize(insertStatement)
        return message
    }
    
    // 查询
    func query() -> String {
        var message = ""
        var queryStatement: OpaquePointer?
        
        if db == nil {
            self.openDataBase()
        }
        
        let queryResult = sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil)
        if queryResult == SQLITE_OK {
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                guard let queryResultCol1 = sqlite3_column_text(queryStatement, 1) else {
                    return "查询结果：nil"
                }
                let name = String(cString: queryResultCol1)
                message = "查询结果: \(name)"
            } else {
                message = "没有查询结果"
            }
            sqlite3_finalize(queryStatement)
        } else {
            message = "查询失败。原因：\(queryResult)"
        }
        return message
    }
    
    // 更新
    func update() -> String {
        var message = ""
        var updateStatement: OpaquePointer?
        
        if db == nil {
            self.openDataBase()
        }
        
        let updateResult = sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil)
        if updateResult == SQLITE_OK {
            let stepResult = sqlite3_step(updateStatement)
            message = stepResult == SQLITE_DONE ? "更新成功" : "不能更新。原因: \(stepResult)"
            sqlite3_finalize(updateStatement)
        } else {
            message = "更新语句执行失败。原因: \(updateResult)"
        }
        return message
    }
    
    // 删除
    func delete() -> String {
        var message = ""
        var deleteStatement: OpaquePointer?
        
        if db == nil {
            self.openDataBase()
        }
        
        let deleteResult = sqlite3_prepare_v2(db, deleteStatementString, -1, &deleteStatement, nil)
        if deleteResult == SQLITE_OK {
            let stepResult = sqlite3_step(deleteStatement)
            message = stepResult == SQLITE_DONE ? "删除成功" : "删除失败。原因: \(stepResult)"
            sqlite3_finalize(deleteStatement)
        } else {
            message = "删除数据库记录失败。原因: \(deleteResult)"
        }
        return message
    }
}


enum Actions {
    case openDB
    case createTable
    case dropTable
    case query
    case insert
    case delete
    case update
    case no
}


struct api_SQLite3: View {
    @State var sqliteAction: Actions = .no
    @State var SqlStatement: String = ""
    
    @State var isOpenDB: Bool = false
    @State var message: String = ""
    
    var body: some View {
        ScrollView {
            
            Button("打开数据库") {
                self.message = Database().openDataBase()
                showConsoleMessage(Actions.openDB)
            }
            .buttonStyle(PrimaryBtnStyle())
            
            Button("创建数据库表") {
                self.message = Database().createTable()
                showConsoleMessage(Actions.createTable)
            }
            .buttonStyle(PrimaryBtnStyle())
            
            Button("删除数据库表") {
                self.message = Database().dropTable()
                showConsoleMessage(Actions.dropTable)
            }
            .buttonStyle(PrimaryBtnStyle())
            
            Button("在数据库表插入一条数据") {
                self.message = Database().insert()
                showConsoleMessage(Actions.insert)
            }
            .buttonStyle(PrimaryBtnStyle())
            
            Button("查询数据库表") {
                self.message = Database().query()
                showConsoleMessage(Actions.query)
            }
            .buttonStyle(PrimaryBtnStyle())
            
            Button("更新数据库表") {
                self.message = Database().update()
                showConsoleMessage(Actions.update)
            }
            .buttonStyle(PrimaryBtnStyle())
            
            Button("从数据库表删除一条记录") {
                self.message = Database().delete()
                showConsoleMessage(Actions.delete)
            }
            .buttonStyle(PrimaryBtnStyle())
            
            if self.message != "" {
                VStack(alignment: .leading) {
                    Text("操作结果:")
                        .font(.title3)
                        .padding(10)
                    
                    Text("\(message)")
                        .font(.body)
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if self.SqlStatement != "" {
                        Text("执行语句：\(SqlStatement)")
                            .font(.body)
                            .padding(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .background(.gray.opacity(0.1))
                .frame(height: 200)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("SQLite3")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "API",pageID: "SQLite3"))
    }
    
    func showConsoleMessage(_ param: Actions) {
        self.sqliteAction = param
        switch(self.sqliteAction) {
        case .openDB:
            self.SqlStatement = ""
        case .update:
            self.SqlStatement =  updateStatementString
        case .createTable:
            self.SqlStatement =  createTableString
        case .dropTable:
            self.SqlStatement = dropTableString
        case .query:
            self.SqlStatement =  queryStatementString
        case .insert:
            self.SqlStatement =  insertStatementString
        case .delete:
            self.SqlStatement =  deleteStatementString
        case .no:
            self.SqlStatement =  ""
        }
    }
}

struct api_SQLite3_Previews: PreviewProvider {
    static var previews: some View {
        api_SQLite3()
    }
}
