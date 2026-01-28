//
//  ItemEditView.swift
//  pia14iosjan21
//
//  Created by BillU on 2026-01-26.
//

import SwiftUI
import SwiftData

struct ItemEditView: View {
    
    @Binding var currentitem : PIAItem?
    
    @State private var editname : String = ""
    @State private var editamount : String = ""
    @State private var editbrand : String = ""
    
    var body: some View {
        
        VStack {
            
            TextField("", text: $editname)
                .prettyTextfield(headertext: "Name")
                .onChange(of: editname) { oldValue, newValue in
                    currentitem!.itemname = newValue
                }
            
            TextField("", text: $editamount)
                .prettyTextfield(headertext: "Amount")
            
            TextField("", text: $editbrand)
                .prettyTextfield(headertext: "Brand")
            
            
            
        }
        .onAppear() {
            editname = currentitem!.itemname
            editamount = "\(currentitem!.itemamount)"
            if currentitem!.itembrand != nil {
                editbrand = currentitem!.itembrand!
            }
        }
        
    }
}

#Preview {
    ItemEditView(currentitem: .constant(PIACode.getExampleItem()))
        .modelContainer(PIACode.getExampleContainer())
}

