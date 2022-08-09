//
//  ViewPicker.swift
//  format
//
//  Created by hx on 7/28/22.
//

import SwiftUI

enum Colors: String, CaseIterable, Identifiable {
    case yellow
    case blue
    case white
    var id: Self { self }
}

enum Fruits: String, CaseIterable, Identifiable {
    case apple
    case banana
    var id: Self { self }
}

struct v_Picker: View {
    @State private var isOpen: Bool = false
    @State private var selectedColor: Colors = .white
    
    var body: some View {
        VStack {
            List {
                
                Section(header: Text("默认样式")) {
                    Picker("Colors", selection: $selectedColor) {
                        ForEach(Colors.allCases) { item in
                            Text(item.rawValue.capitalized)
                        }
                    }
                }
                
                Section(header: Text("menu样式").textCase(.none)) {
                    Picker("Colors", selection: $selectedColor) {
                        ForEach(Colors.allCases) { item in
                            Text(item.rawValue.capitalized)
                        }
                    }.pickerStyle(.menu)
                }
                
                Section(header: Text("segmented样式").textCase(.none)) {
                    Picker("Colors", selection: $selectedColor) {
                        ForEach(Colors.allCases) { item in
                            Text(item.rawValue.capitalized)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section(header: Text("wheel样式").textCase(.none)) {
                    NavigationLink("wheel样式选择器", destination: examplePickerForWheel())
                }
                
                Section(header: Text("底部弹出的Sheet窗口")) {
                    NavigationLink("Picker", destination: FromButonPicker())
                }
                
                Section(header: Text("多列选择器")) {
                    NavigationLink("选择省市", destination: exampleMultiPicker())
                }
                
                Section(header: Text("ColorPicker").textCase(.none)) {
                    NavigationLink("颜色选择器", destination: ViewColorPicker())
                }
                
                Section(header: Text("DatePicker").textCase(.none)) {
                    NavigationLink("日期选择器", destination: exampleDatePicker())
                }
            }
        }.navigationBarTitle(Text("Picker"), displayMode: .inline)
        
    }
        
    
}

struct FromButonPicker: View {
    @State private var isShowSheet: Bool = false
    @State private var selected: Fruits = .apple
    
    var body: some View {
        Button(action: {
            self.isShowSheet.toggle()
        }, label: {
            Text("选择的水果：\(selected.rawValue)")
        })
            .foregroundColor(.black)
            .sheet(isPresented: $isShowSheet,onDismiss: didDismiss) {
                VStack {
                    Picker("Fruits", selection: $selected) {
                        ForEach(Fruits.allCases) { item in
                            Text(item.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.wheel)
                    Button("关闭窗口",action: { isShowSheet.toggle() })
                }
                .frame(height: 100)
            }
    }
    
    func didDismiss() {
        
    }
}


struct exampleMultiPicker: View {
    let provList: Array = ["山西省"]
    let cityList: Array = ["临汾市", "长治市", "大同市", "运城市"]
    
    @State private var selectedProv: String = "山西省"
    @State private var selectedCity: String = "大同市"
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    Picker("selecte prov", selection: $selectedProv) {
                        ForEach(provList, id: \.self) { item in
                            Text(item)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: geometry.size.width / 2, alignment: .center)
                    .clipped()
                    
                    Picker("selecte prov", selection: $selectedCity) {
                        ForEach(cityList, id: \.self) { item in
                            Text(item)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: geometry.size.width / 2, alignment: .center)
                    .clipped()
                }
            }
        }
    }
}


struct examplePickerForWheel: View {
    @State private var isOpen: Bool = false
    @State private var selectedColor: Colors = .white
    
    var body: some View {
        VStack {
            Picker("Colors", selection: $selectedColor) {
                ForEach(Colors.allCases) { item in
                    Text(item.rawValue.capitalized)
                }
            }.pickerStyle(.wheel)
        }
    }
}

struct ViewColorPicker: View {
    @State private var bgColor = Color.blue.opacity(0.5)
        
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 120, height: 120)
                    .foregroundColor(bgColor)
                    .padding(.horizontal)
            }
            
            ColorPicker("请选择区域背景色", selection: $bgColor)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarTitle(Text("ColorPicker"), displayMode: .inline)
    }
}


struct exampleDatePicker: View {
    @State private var date = Date()
    
    // 格式化日期
    static let dateFormatter: DateFormatter = {
        let formmatter = DateFormatter()
        formmatter.dateFormat = "YYYY-MM-dd"
        return formmatter
    }()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("当前日期").textCase(.none)) {
                    DatePicker(
                        "当前日期",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                }
                
                Section(header: Text("当前日期").textCase(.none)) {
                    DatePicker(
                        "当前时间",
                        selection: $date,
                        displayedComponents: [.hourAndMinute]
                    )
                }
                
                Section() {
                    Text("格式化日期: \(date, formatter: Self.dateFormatter)")
                }
                
                DatePicker(
                    "开始日期",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
            }
        }
    }
}


struct v_Picker_Previews: PreviewProvider {
    static var previews: some View {
        v_Picker()
    }
}
