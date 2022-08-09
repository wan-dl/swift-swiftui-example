import SwiftUI

struct todoAddPageView: View {
    
    @Binding var isPresented: Bool
    
    @State var task: String = ""

    var addItem: (String)->Void

    var body: some View {
        NavigationView {
            VStack {
                HStack (alignment: .center){
                    Button("取消") {
                        isPresented = false
                    }.padding()

                    Spacer()

                    Text("添加待办事项")
                        .padding()

                    Spacer()

                    Button("添加") {
                        if task.count > 0 {
                            isPresented = false
                            addItem(task)
                        }
                    }
                    .foregroundColor(task.count > 0 ? Color.blue: Color.gray )
                    .padding()

                }.frame(height: 44)

                VStack {
                    Group {
                        TextField("标题", text: $task).padding()
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                }
                Spacer()
            }
            .edgesIgnoringSafeArea([.bottom])
            .background(Color("pageBgColor").edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
        }
    }
}

struct todoAddPageView_Previews: PreviewProvider {
    static var previews: some View {
        todoAddPageView(isPresented: .constant(true)) { value in }
    }
}
