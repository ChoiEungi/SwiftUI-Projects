//
//  ContentView.swift
//  grid_view
//
//  Created by 최은기 on 2021/07/14.
//

import SwiftUI


struct ContentView: View {
    @State private var selectedGridType: GridType = .single
    var items = Item.dummydata
    
    var body: some View {
        VStack{
            GridPickerView(girdType: $selectedGridType)
            ImageStyleView(items: items, gridType: $selectedGridType)
        }
        
    }
}


struct ImageStyleView: View {
    var items : [Item]
    @Binding var gridType: GridType
    
    var body: some View{
        ScrollView{
            LazyVGrid(columns: gridType.columns, content: {
                ForEach(items){ item in
                    switch gridType {
                    case .single, .double:
                        SingleRowView(item: item)
                    default:
                    Image(item.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)

                    }
                }
            })
            .animation(.default)
            
        }
    }
}


struct GridPickerView: View {
    
    @Binding var girdType: GridType
    
    var body: some View{
        Picker("Gird Type", selection: $girdType) {
            ForEach(GridType.allCases, id: \.self){ type in
                switch type {
                case .single :
                    Image(systemName: "rectangle.grid.1x2")
                case .double:
                    Image(systemName: "rectangle.grid.2x2")
                case .triple:
                    Image(systemName: "rectangle.grid.3x2")
                case .adaptive:
                    Image(systemName: "rectangle.3.offgrid.fill")
                
                }
                
            }
        }.pickerStyle(SegmentedPickerStyle())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
