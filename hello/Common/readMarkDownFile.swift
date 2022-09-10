//
//  readMarkDownFile.swift
//  HelloSwift
//
//  Created by 1 on 9/9/22.
//

import SwiftUI

struct readMarkDownFile: View {
//    @State private var mdContents: AttributedString = ""
    @State var mdDir: String = ""
    @State var mdPath: String = ""
    @State var mdTitle: String = ""
    @State private var mdContents: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Text(mdContents)
                    .task() {
                        await readfile()
                    }
            }
            .padding()
        }
    }
    
    func readfile() async {
        do {
            let subDir = mdDir.isEmpty ? "/Resouces.bundle/" : "/Resouces.bundle/\(mdDir)/"
            let fileURL = Bundle.main.url(forResource: mdPath, withExtension: ".md", subdirectory: subDir)
            if fileURL == nil {
                return
            }
            if let fileContents = try? String(contentsOf: fileURL!) {
                mdContents = fileContents
            }
            
//            if let fileContents = try? AttributedString(contentsOf: fileURL!) {
//                var tmp = fileContents
//                if let range = tmp.range(of: "xxx") {
//                    tmp[range].foregroundColor = .yellow
//                    tmp.characters.replaceSubrange(range, with: "xx")
//               }
//                mdContents = tmp
//            }
        } catch {
            print(error)
        }
    }
}

struct readMarkDownFile_Previews: PreviewProvider {
    static var previews: some View {
        readMarkDownFile()
    }
}
