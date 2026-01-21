//
//  PlaceView.swift
//  pia14iosjan21
//
//  Created by BillU on 2026-01-21.
//

import SwiftUI
import SwiftData

struct PlaceView: View {
    @Environment(\.modelContext) private var modelContext
    
    var currentplace : PIAPlace
    
    @State var additem = ""
    var body: some View {
        VStack {
            
            Text(currentplace.name)
            
            HStack {
                TextField("Add item", text: $additem)
                
                Button("Add") {
                    let newitem = PIAItem(place: currentplace, itemname: additem)
                    currentplace.items.append(newitem)
                    modelContext.insert(newitem)
                }
            }
            
            List {
                ForEach(currentplace.items) { item in
                    NavigationLink(destination: ItemView(currentitem: item)) {
                        Text(item.itemname)

                    }
                }
            }
            
        }
        .padding()
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

    
    return PlaceView(currentplace: exampleplace)
        .modelContainer(container)
        
}
