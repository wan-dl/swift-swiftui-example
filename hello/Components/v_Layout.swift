//
//  ViewLayout.swift
//  format
//
//  Created by 1 on 7/27/22.
//

import SwiftUI

struct v_Layout: View {
    
    let colors: [Color] =
        [.red, .orange, .yellow]

    
    var body: some View {
        ScrollView() {
            VStack(alignment: .center, spacing: 15) {
                
                Section(header: Text("ZStack: 覆盖布局").font(.body)) {
                    ZStack {
                        ForEach(0..<colors.count) {
                            Rectangle()
                                .fill(colors[$0])
                                .frame(width: 100, height: 100)
                                .offset(x: CGFloat($0) * 10.0,
                                        y: CGFloat($0) * 10.0)
                        }
                           
                    }
                    .frame(height: 180)
                }
                
                Section(header: Text("HStack: 横向布局").font(.body)) {
                    HStack {
                        RoundedRectangle(cornerRadius: 0)
                            .fill(.red.opacity(0.8))
                        RoundedRectangle(cornerRadius: 0)
                            .fill(.green.opacity(0.8))
                        RoundedRectangle(cornerRadius: 0)
                            .fill(.blue.opacity(0.8))
                           
                    }
                    .frame(height: 150)
                    .padding()
                }
                
                
                Section(header: Text("VStack: 纵向布局").font(.body)) {
                    VStack {
                        Rectangle()
                           .fill(.red.opacity(0.8))
                        Rectangle()
                           .fill(.green.opacity(0.8))
                        Rectangle()
                           .fill(.blue.opacity(0.8))
                    }
                    .frame(height: 180)
                    .padding()
                }
                
                Section(header: Text("组合布局").font(.body)) {
                    HStack {
                        HStack {
                            Rectangle()
                               .fill(.red.opacity(0.8))
                        }
                        HStack {
                            VStack {
                                Rectangle()
                                   .fill(.green.opacity(0.8))
                                
                                Rectangle()
                                   .fill(.blue.opacity(0.8))
                            }
                        }
                           
                    }
                    .frame(height: 150)
                    .padding()
                }
                
                
                
                Section(header: Text("指定宽度").font(.body)) {
                    HStack {
                        GeometryReader { geometry in
                            HStack {
                                ZStack {
                                    Rectangle()
                                       .fill(.red.opacity(0.8))
                                    Label("70%", systemImage: "percent").labelStyle(.titleOnly)
                                }
                            }
                            HStack {
                                ZStack {
                                    Rectangle()
                                       .fill(.green.opacity(0.8))
                                    Label("30%", systemImage: "percent").labelStyle(.titleOnly)
                                }
                            }.frame(width: geometry.size.width * 0.3)
                        }
                    }
                    .frame(height: 150)
                    .padding()
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct v_Layout_Previews: PreviewProvider {
    static var previews: some View {
        v_Layout()
    }
}
