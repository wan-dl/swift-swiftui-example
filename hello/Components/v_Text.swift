//
//  ViewTextFont.swift
//  format
//
//  Created by 1 on 7/26/22.
//

import SwiftUI


struct v_Text: View {
    struct Item: Identifiable {
        let name: String
        let desc: String
        let style: Font
        let id = UUID()
    }
    
    let ContentData: Array = [
        Item(name: "largeTitle", desc: ".font(.largeTitle) 大标题", style: .largeTitle),
        Item(name: "title", desc: ".font(.title) 标题", style: .title),
        Item(name: "title2", desc: ".font(.title2) 二级标题", style: .title2),
        Item(name: "title3", desc: ".font(.title3) 三级标题", style: .title3),
        Item(name: "headline", desc: " .font(.headline) 标题", style: .headline),
        Item(name: "subheadline", desc: ".font(.subheadline) 副标题", style: .subheadline),
        Item(name: "body", desc: ".font(.body) 正文 ", style: .body),
        Item(name: "callout", desc: ".font(.callout) 标注文本", style: .callout),
        Item(name: "caption", desc: ".font(.caption)", style: .caption),
        Item(name: "caption2", desc: ".font(.caption2)", style: .caption2),
        Item(name: "footnote", desc: ".font(.footnote) 脚注文本", style: .footnote),
        Item(name: "size=20", desc: ".font(.system(size: 20))", style: .system(size: 20)),
    ]
    
    var body: some View {
        
        VStack {
            List {
                Section(header: Text("Text Font").textCase(.lowercase)) {
                    ForEach(ContentData, id: \.id) {item in
                        HStack {
                            Text("北京")
                                .font(item.style)
                                .frame(width: 80)
                            
                            Text(item.desc)
                                .frame(alignment: .trailing)
                                .foregroundColor(.gray)
                                .font(.callout)
                        }
                    }
                }
                
                Section(header: Text("Text fontWeight").textCase(.lowercase)) {
                    HStack {
                        Text("北京").fontWeight(.bold).frame(width: 80)
                        Text(".fontWeight(.bold)").foregroundColor(.gray).font(.callout)
                    }
                    
                    HStack {
                        Text("北京").fontWeight(.light).frame(width: 80)
                        Text(".fontWeight(.light)").foregroundColor(.gray).font(.callout)
                    }
                    
                    HStack {
                        Text("北京").fontWeight(.medium).frame(width: 80)
                        Text(".fontWeight(.medium)").foregroundColor(.gray).font(.callout)
                    }
                }
                
                Section(header: Text("Text 其它样式").textCase(.lowercase)) {
                    HStack {
                        Text("前景色").foregroundColor(.red).frame(width: 80)
                        Text(".foregroundColor(.red)").foregroundColor(.gray).font(.callout)
                    }
                    
                    HStack {
                        Text("斜体").italic().frame(width: 80)
                        Text(".italic()").foregroundColor(.gray).font(.callout)
                    }
                    
                    HStack {
                        Text("粗体").bold().frame(width: 80)
                        Text(".bold()").foregroundColor(.gray).font(.callout)
                    }
                    
                    HStack {
                        Text("删除线").strikethrough().frame(width: 80)
                        Text(".strikethrough()").foregroundColor(.gray).font(.callout)
                    }
                    
                    HStack {
                        Text("下划线").underline().frame(width: 80)
                        Text(".underline()").foregroundColor(.gray).font(.callout)
                    }
                    
                    HStack {
                        Text("name").textCase(.uppercase).frame(width: 80)
                        Text(".textCase(.uppercase) 大写").foregroundColor(.gray).font(.callout)
                    }
                    
                    HStack {
                        Text("NAME").textCase(.lowercase).frame(width: 80)
                        Text(".textCase(lowercase) 小写").foregroundColor(.gray).font(.callout)
                    }
                   
                }
                
                Section(header: Text("Text 超出截断 .lineLimit(1)").textCase(.lowercase)) {
                    Text("Sets the maximum number of lines that text can occupy in this view.").lineLimit(1)
                }
                
                Section(header: Text("Text 背景色 .background(.blue)").textCase(.lowercase)) {
                    Text("背景色").background(.blue)
                }
                
                Section(header: Text("Text 行间隔 .lineSpacing(20)").textCase(.lowercase)) {
                    Text("生命不止\n奋斗不息").lineSpacing(20)
                }
                
                Section(header: Text("Text 可以被选择的文本 .textSelection()").textCase(.lowercase)) {
                    Text("此段文本可以被选中")
                        .textSelection(.enabled)
                }
            }
        }
        .navigationTitle("Text")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI", pageID: "Text"))
    }
}

struct v_Text_Previews: PreviewProvider {
    static var previews: some View {
        v_Text()
    }
}
