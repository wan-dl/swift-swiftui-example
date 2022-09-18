//
//  ArticleList.swift
//  HelloSwift
//
//  Created by 1 on 9/18/22.
//

import SwiftUI


struct article: Identifiable {
    let id = UUID()
    var title: String
    var desc: String
    var publishedTime: String
    var tagName: String
}

struct ArticleList: View {
    @State var articleList: [article] = [article(title: "Auto Layout, Hugs Content, Fill Container and Design System", desc: "Lear how to use Auto Layout, Hugs Content, Fill Container, Constraints and how to organize your....", publishedTime: "2天前", tagName: "SwiftUI"), article(title: "Auto Layout, Hugs Content, Fill Container and Design System", desc: "Lear how to use Auto Layout, Hugs Content, Fill Container, Constraints and how to organize your....", publishedTime: "2天前", tagName: "SwiftUI")]
    
    var body: some View {
        List() {
            if !articleList.isEmpty {
                ForEach(articleList, id: \.id) {item in
                    shapeStyleForArticleList(title: item.title, desc: item.desc, tagName: item.tagName, publishedTime: item.publishedTime)
                }
            }
        }
    }
}

struct shapeStyleForArticleList: View {
    @State var icon: String = ""
    @State var title: String = ""
    @State var desc: String = ""
    @State var tagName: String = ""
    @State var publishedTime: String = ""
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.body)
                .lineLimit(1)
            
            HStack() {
                Text(tagName)
                    .font(.caption)
                Text(publishedTime)
                    .font(.caption)
                Spacer()
            }
            .foregroundColor(.gray)
            .padding(.vertical, 1)
            
            Text(desc)
                .font(.callout)
                .foregroundColor(.gray)
                .lineLimit(2)
        }
        .padding()
        .frame(width: .infinity)
        .background(.white)
    }
}

struct ArticleList_Previews: PreviewProvider {
    static var previews: some View {
        ArticleList()
    }
}
