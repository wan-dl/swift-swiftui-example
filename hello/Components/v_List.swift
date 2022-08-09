//
//  ViewList.swift
//  format
//
//  Created by 1 on 7/29/22.
//

import SwiftUI

struct LangItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imgName: String
}


struct v_List: View {
    
    @State var LangList: [LangItem] = [
        LangItem(name: "Python", imgName: ""),
        LangItem(name: "Java", imgName: "")
    ]
    @State private var multiSelection = Set<UUID>()
    @State var searchText: String = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(LangList.filter {$0.name.hasPrefix(searchText)}) {
                    Text($0.name)
                }
                .onDelete(perform: deleteItem)
                .onMove(perform: moveItem)
                
            }
            .searchable(text: $searchText)
            .toolbar {
                EditButton()
            }
            
            HStack {
                Button(action: addItem, label: {
                    Label("添加语言", systemImage: "plus")
                })
            }
            .frame(height: 40)
        }
        .navigationBarTitle(Text("List - 列表"), displayMode: .inline)
    }
    
    func addItem() {
        LangList.append(LangItem(name: "JavaScript", imgName: ""))
    }
    
    func deleteItem(at offsets: IndexSet) {
        LangList.remove(atOffsets: offsets)
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        LangList.move(fromOffsets: source, toOffset: destination)
    }
}



struct v_List_Previews: PreviewProvider {
    static var previews: some View {
        v_List()
    }
}
