//
//  v_Grid.swift
//  HelloSwift
//
//  Created by 1 on 8/3/22.
//

import SwiftUI

struct v_Grid: View {
    
    var body: some View {
        if #available(iOS 16.0, *) {
//            ShowGrid
            Text("Gird 仅支持iOS 16.0, 且真机运行有Bug")
                .font(.body)
        } else {
            Text("Gird 仅支持iOS 16.0")
                .font(.body)
        }
    }
    
//    @available(iOS 16.0, *)
//    var ShowGrid: some View {
//        Grid(alignment: .bottom, horizontalSpacing: 1, verticalSpacing: 1) {
//            GridRow {
//                Text("Row 1")
//                ForEach(0..<2) { _ in Color.red }
//            }
//            GridRow {
//                Text("Row 2")
//                ForEach(0..<5) { _ in Color.green }
//            }
//            GridRow {
//                Text("Row 3")
//                ForEach(0..<4) { _ in Color.blue }
//            }
//        }
//        .frame(height: 200)
//        .padding()
//    }
}

struct v_Grid_Previews: PreviewProvider {
    static var previews: some View {
        v_Grid()
    }
}
