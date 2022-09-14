//
//  v_fileExporter.swift
//  HelloSwift
//
//  Created by 1 on 9/4/22.
//

import SwiftUI
import UniformTypeIdentifiers

struct MessageDocument: FileDocument {
    
    static var readableContentTypes: [UTType] { [.plainText] }
    var message: String

    init(message: String) {
        self.message = message
    }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        message = string
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper(regularFileWithContents: message.data(using: .utf8)!)
    }
}

struct v_fileExporter: View {
    @State private var showingExporter = false
    @State var exportStatus = false
    
    let DocumentContent: MessageDocument = MessageDocument(message: "锄禾日当午，\n汗滴禾下土，\n谁知盘中餐，\n粒粒皆辛苦。")
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            Text(DocumentContent.message)
                .font(.title3)
                .fileExporter(
                    isPresented: $showingExporter,
                    document: DocumentContent,
                    contentType: .plainText,
                    defaultFilename: "swiftui-example"
                ) { result in
                    if case .success = result {
                        self.exportStatus = true
                    } else {
                        self.exportStatus = false
                    }
                }
            
            Button(action: {
                self.showingExporter.toggle()
            }, label: {
                Label("导出以上内容到文件", systemImage: "square.and.arrow.up.on.square")
            })
            .toast(isShow: $exportStatus, info: exportStatus ? "导出成功" : "导出失败")
            .buttonStyle(.bordered)
            
            Text("简介：本页面示例，主要使用了.fileExporter()方法")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
        }
        .navigationTitle("fileExporter")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "fileExporter"))
    }
}

struct v_fileExporter_Previews: PreviewProvider {
    static var previews: some View {
        v_fileExporter()
    }
}
