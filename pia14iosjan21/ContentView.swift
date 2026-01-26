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
                    
                    Button("Add") {
                        let newplace = PIAPlace(name: addplace)
                        modelContext.insert(newplace)
                    }
                }
                
                List {
                    ForEach(piaplaces) { place in
                        NavigationLink(destination: PlaceView(currentplace: place)) {
                            
                            
                            HStack {
                                Text(place.name)
                                
                                Text("\(place.items.count)")
                                
                                VStack {
                                }
                                .frame(width: 50, height: 50)
                                .background(PIACode.getPlaceColor(colornumber: place.placecolor))
                            }
                            
                        }
                        
                    }
                }
                
            }
            .padding()
        }
    }

    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: PIAPlace.self, configurations: config)

    var exampleplace = PIAPlace(name: "Example Place")
    
    container.mainContext.insert(exampleplace)
    
    var exampleitem1 = PIAItem(place: exampleplace, itemname: "Example Item one", itemamount: 1)
    exampleplace.items.append(exampleitem1)

    var exampleitem2 = PIAItem(place: exampleplace, itemname: "Example Item two", itemamount: 1)
    exampleplace.items.append(exampleitem2)

    
    return ContentView()
        .modelContainer(container)
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
