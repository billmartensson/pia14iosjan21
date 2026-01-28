//
//  ContentView.swift
//  pia14iosjan21
//
//  Created by BillU on 2026-01-21.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var piaplaces: [PIAPlace]

    @State var addplace = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Add place", text: $addplace)
                        .prettyTextfield(headertext: "Add place")

                    Button("Add") {
                        let newplace = PIAPlace(name: addplace)
                        modelContext.insert(newplace)
                    }
                    
                    
                }
                .padding(.horizontal, 16)
                
                List {
                    ForEach(piaplaces) { place in
                        
                        PlaceRowView(place: place)
                            .background(
                                NavigationLink("", destination: PlaceView(currentplace: place))
                            )
                        
                        .listRowInsets(
                            EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                        )
                    }
                }
                .listStyle(.inset)
            }
        }
    }

    
}
/*
 NavigationLink(destination: PlaceView(currentplace: place)) {
     }

*/
#Preview {
    return ContentView()
        .modelContainer(PIACode.getExampleContainer())
}



/*

 NavigationSplitView {
     List {
         ForEach(items) { item in
             NavigationLink {
                 Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
             } label: {
                 Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
             }
         }
         .onDelete(perform: deleteItems)
     }
     .toolbar {
         ToolbarItem(placement: .navigationBarTrailing) {
             EditButton()
         }
         ToolbarItem {
             Button(action: addItem) {
                 Label("Add Item", systemImage: "plus")
             }
         }
     }
 } detail: {
     Text("Select an item")
 }
 
 
 
 private func addItem() {
     withAnimation {
         let newItem = Item(timestamp: Date())
         modelContext.insert(newItem)
     }
 }

 private func deleteItems(offsets: IndexSet) {
     withAnimation {
         for index in offsets {
             modelContext.delete(items[index])
         }
     }
 }

*/
