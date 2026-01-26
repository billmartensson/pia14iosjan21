//
//  ItemDetailView.swift
//  pia14iosjan21
//
//  Created by BillU on 2026-01-26.
//

import SwiftUI
import SwiftData

struct ItemDetailView: View {
    
    var currentitem : PIAItem
    
    var body: some View {
        
        VStack {
            Text(currentitem.itemname)
            
            Text("Amount: \(currentitem.itemamount)")
            
            if currentitem.itembrand == nil {
                Text("No brand")
            } else {
                Text("Brand: \(currentitem.itembrand!)")
            }
        }
        
    }
}

#Preview {
        
    ItemDetailView(currentitem: PIACode.getExampleItem())
        .modelContainer(PIACode.getExampleContainer())
}
