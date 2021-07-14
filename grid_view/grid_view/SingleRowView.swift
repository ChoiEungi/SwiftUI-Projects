//
//  SingleRowView.swift
//  grid_view
//
//  Created by 최은기 on 2021/07/14.
//

import SwiftUI

struct SingleRowView: View {
    
    let item: Item
    
    var body: some View {
        ZStack{
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack{
                Spacer()
                HStack{
                    VStack(alignment: .leading){
                        Text(item.mainTitle)
                            .font(.headline)
                            .lineLimit(1)
                        Text(item.subTitle)
                            .font(.subheadline)
                            .lineLimit(1)
                    }
                    Spacer()
                }
                .padding(10)
                .background(Color.white.opacity(0.5))
            }
            
        }
    }
}

struct SingleRowView_Previews: PreviewProvider {
    static var previews: some View {
        SingleRowView(item: Item(mainTitle: "hi", subTitle: "subTitle", imageName: "img1"))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/))
    }
}
