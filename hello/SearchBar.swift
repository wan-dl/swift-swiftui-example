import SwiftUI

struct ContentView: View {

    @State
    var text: String = ""

    var body: some View {
        VStack {
            SearchBarView(text: $text)
                .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static
    var previews: some View {
        ContentView()
    }
}

// SearchBarView搜索栏视图

struct SearchBarView: View {

    @Binding
    var text: String
    @State private
    var isEditing = false
    @State private
    var offset: CGFloat = .zero //使用.animation防止报错，iOS15的特性

    var body: some View {

        HStack {

            TextField("搜你想看的", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {

                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)

                        // 编辑时显示清除按钮
                        if isEditing {

                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)

                // 点击时
                .onTapGesture {
                    self.isEditing = true
                }

            // 搜索按钮
            if isEditing {

                Button(action: {

                        self.isEditing = false
                        self.text = ""

                        // 收起键盘
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:
                            nil, from: nil,
                            for: nil)
                    }) {
                        Text("搜索")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default, value: offset)
            }
        }
    }
}
