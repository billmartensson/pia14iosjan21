//
//  PlaceRowView.swift
//  pia14iosjan21
//
//  Created by BillU on 2026-01-28.
//

import SwiftUI

struct PlaceRowView: View {
    
    var place : PIAPlace
    
    var body: some View {
        HStack {
            Text(place.name)
                .foregroundStyle(place.placecolor == nil ? Color.black : Color.white)
            
            Spacer()
            
            Text("\(place.items.count)")
                .frame(width: 40, height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .stroke(Color.black, lineWidth: 2)
                )
            
            Image(systemName: "chevron.right")
                .font(.system(size: 20))
                .foregroundStyle(place.placecolor == nil ? Color.black : Color.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .padding(.horizontal, 20)
        .background(PIACode.getPlaceColor(colornumber: place.placecolor))
    }
}

#Preview {
    VStack {
        PlaceRowView(place: PIACode.getExamplePlace())
        PlaceRowView(place: PIACode.getExamplePlace2())
    }
}
