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
    
    var currentitem : PIAItem
    
    @State var isEdit = false
    
    @State var editname = ""
    
    func changeedit() {
        if isEdit == false {
            isEdit = true
        } else {
            currentitem.itemname = editname
            isEdit = false
        }
    }
    
    func deleteitem() {
        modelContext.delete(currentitem)
    }
    
    var body: some View {
        
        VStack {
            
            if isEdit == false {
                Text(currentitem.itemname)
            }
            
            if isEdit == true {
                TextField("", text: $editname)
            }
            
            Text("Place: \(currentitem.place.name)")
            
            Spacer()
        }
        .padding()
        .onAppear() {
            editname = currentitem.itemname
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Delete") {
                    deleteitem()
                }
            }
            ToolbarItem {
                Button(isEdit ? "Save" : "Edit") {
                    changeedit()
                }
            }
        }
        
    
        
    }
}

#Preview {
    
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: PIAPlace.self, configurations: config)

    var exampleplace = PIAPlace(name: "Example Place")
    
    container.mainContext.insert(exampleplace)
    
    var exampleitem1 = PIAItem(place: exampleplace, itemname: "Example Item one")
    exampleplace.items.append(exampleitem1)

    var exampleitem2 = PIAItem(place: exampleplace, itemname: "Example Item two")
    exampleplace.items.append(exampleitem2)

    
    return NavigationStack {
        ItemView(currentitem: exampleitem1)
            .modelContainer(container)
    }
    
}
