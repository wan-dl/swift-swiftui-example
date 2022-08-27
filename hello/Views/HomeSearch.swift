//
//  HomeSearch.swift
//  HelloSwift
//
//  Created by 1 on 8/27/22.
//

import SwiftUI

struct HomeSearch: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var isSearch: Bool = false
    @State private var searchKeyword: String = ""
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("搜索", text: $searchKeyword)
                    .submitLabel(.search)
                    .padding(.horizontal, 10)
                    .frame(height: 35)
                    .background(.white)
                    .cornerRadius(10)
                    .focused($isFocused)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            isFocused = true
                        }
                    }
                
                Spacer()
                
                Button(action: {
                    self.dismiss()
                }, label: {
                    Text("取消")
                        .foregroundColor(.black.opacity(0.8))
                })
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
            Spacer()
                
        }
        .padding()
        .background(.gray.opacity(0.2))
        .navigationBarBackButtonHidden()
    }
}

struct HomeSearch_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearch()
    }
}
