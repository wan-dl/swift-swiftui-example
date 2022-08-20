//
//  ViewfullScreenCover.swift
//  format
//
//  Created by 1 on 7/28/22.
//

import SwiftUI

@available (iOS 14.0, *)
struct v_fullScreenCover: View {
    @State private var isPresenting = false
    
    var body: some View {
        VStack {
            Button(action: {
                isPresenting = true
            }, label: {
                Text("显示 Full Screen Cover").font(.title)
            })
            .fullScreenCover(isPresented: $isPresenting, onDismiss: didDismiss) {
                VStack {
                    Text("2022年").font(.title)
                }
                .onTapGesture {
                    isPresenting = false
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.gray.opacity(0.2))
                .ignoresSafeArea(edges: .all)
                
            }
            
            Text("Presents a modal view that covers as much of the screen as possible using the binding you provide as a data source for the sheet’s content.")
                .font(.body)
                .padding()
        }
        .navigationTitle(".fullScreenCover")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func didDismiss() {
        
    }
}

struct v_fullScreenCover_Previews: PreviewProvider {
    static var previews: some View {
        v_fullScreenCover()
    }
}
