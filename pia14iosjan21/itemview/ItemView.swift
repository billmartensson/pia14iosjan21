//
//  ItemView.swift
//  pia14iosjan21
//
//  Created by BillU on 2026-01-21.
//

import SwiftUI
import SwiftData

struct ItemView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State var currentitem : PIAItem
    @State var edititem : PIAItem?

    @State var isEdit = false
        
    func changeedit() {
        if isEdit == false {
            isEdit = true
        } else {
            //currentitem.itemname = editname
            isEdit = false
        }
    }
    
    func deleteitem() {
        modelContext.delete(currentitem)
    }
    
    var body: some View {
        ZStack {
            
            VStack {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(PIACode.getPlaceColor(colornumber: currentitem.place.placecolor))
            .opacity(0.7)
            
            if isEdit == true {
                ItemEditView(currentitem: $edititem)
            }
            if isEdit == false {
                ItemDetailView(currentitem: currentitem)
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                
                Button(action: {
                    deleteitem()
                }) {
                    Image(systemName: "trash")
                }
            }
            ToolbarItem {
                Button(action: {
                    changeedit()
                }) {
                    if isEdit {
                        Image(systemName: "checkmark.square")
                    } else {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
        .onAppear() {
            edititem = currentitem
        }
        
    }
}


#Preview {
    
    return NavigationStack {
        ItemView(currentitem: PIACode.getExampleItem())
            .modelContainer(PIACode.getExampleContainer())
    }
    
}

