//
//  todoMainPageView.swift
//  format
//
//  Created by hx on 7/22/22.
//

import SwiftUI

struct TodoItem: Identifiable {
    var id: UUID = UUID()
    var task: String
    var imgName: String
}

struct todoMainPageView: View {
    @State var isEditMode: EditMode = .inactive
    @State private var popoverIsShow: Bool = false
    
    @State var listData: [TodoItem] = [
        TodoItem(task: "定外卖", imgName: "pencil.circle"),
        TodoItem(task: "看书", imgName: "square.and.pencil")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("待办事宜")) {
                        ForEach(listData) {item in
                            HStack {
                                Image(systemName: item.imgName)
                                Text(item.task)
                            }
                        }
                        .onDelete(perform: deleteItem)
                        .onMove(perform: moveItem)
                    }
                    Section(header: Text("其它内容")) {
                        Text("hello world")
                    }
                }
                .toolbar {
                    Button(isEditMode.isEditing ? "完成" : "编辑") {
                        switch isEditMode {
                            case .inactive:
                                self.isEditMode = .active
                            case .active:
                                self.isEditMode = .inactive
                            default:
                                break
                        }
                    }
                }
                .environment(\.editMode, $isEditMode)
                .listStyle(GroupedListStyle())
                
                HStack {
                    Button("添加待办事项") {
                        popoverIsShow = true
                    }
                    .padding(.leading)
                    .sheet(isPresented: $popoverIsShow) {
                        
                    } content: {
                        todoAddPageView(isPresented: $popoverIsShow, addItem: addItem)
                    }
                    
                    Spacer()
                }
                .frame(height: 44)
            }
            .navigationTitle(Text("待办清单"))
        }
        .navigationViewStyle(.stack)
    }
    
    func addItem(task: String) {
        listData.append(TodoItem(task: task, imgName: "circle"))
    }
    
    func deleteItem(at offsets: IndexSet) {
        listData.remove(atOffsets: offsets)
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        listData.move(fromOffsets: source, toOffset: destination)
    }
}

struct todoMainPageView_Previews: PreviewProvider {
    static var previews: some View {
        todoMainPageView()
    }
}
