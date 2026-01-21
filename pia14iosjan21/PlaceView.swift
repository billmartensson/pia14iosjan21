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
    @Environment(\.dismiss) private var dismiss
    
    var currentplace : PIAPlace
    
    @State var isEdit = false
    
    @State var additem = ""
    
    @State var editname = ""
    
    @State var showDeleteAlert = false
    
    @State var showColorPick = false
    
    func changeedit() {
        if isEdit == false {
            isEdit = true
        } else {
            currentplace.name = editname
            isEdit = false
        }
    }
    
    func deleteitem() {
        showDeleteAlert = true
    }
    
    
    var body: some View {
        ZStack {
            VStack {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(PIACode.getPlaceColor(colornumber: currentplace.placecolor))
            .opacity(0.7)

            
            VStack {
                
                if isEdit == false {
                    Text(currentplace.name)
                }
                
                if isEdit == true {
                    TextField("", text: $editname)
                }
                
                VStack {
                }
                .frame(width: 50,height: 50)
                .background(PIACode.getPlaceColor(colornumber: currentplace.placecolor))
                .border(Color.black, width: 10)
                .onTapGesture {
                    showColorPick.toggle()
                }
                
                if showColorPick {
                    HStack {
                        VStack {
                        }
                        .frame(width: 30,height: 30)
                        .background(Color.red)
                        .border(Color.black, width: currentplace.placecolor == PlaceColor.red.rawValue ? 10 : 2)
                        .onTapGesture {
                            currentplace.placecolor = PlaceColor.red.rawValue
                            showColorPick = false
                        }
                        
                        VStack {
                        }
                        .frame(width: 30,height: 30)
                        .background(Color.blue)
                        .border(Color.black, width: currentplace.placecolor == PlaceColor.blue.rawValue ? 10 : 2)
                        .onTapGesture {
                            currentplace.placecolor = PlaceColor.blue.rawValue
                            showColorPick = false
                        }
                        
                        VStack {
                        }
                        .frame(width: 30,height: 30)
                        .background(Color.green)
                        .border(Color.black, width: currentplace.placecolor == PlaceColor.green.rawValue ? 10 : 2)
                        .onTapGesture {
                            currentplace.placecolor = PlaceColor.green.rawValue
                            showColorPick = false
                        }
                        
                    }
                }
                
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
            .onAppear() {
                editname = currentplace.name
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Delete") {
                        deleteitem()
                    }
                    .alert("Are you sure you want to delete?", isPresented: $showDeleteAlert) {
                        Button(role: .destructive) {
                            modelContext.delete(currentplace)
                            dismiss()
                        } label: {
                            Text("Delete")
                        }
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
}

#Preview {
    
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: PIAPlace.self, configurations: config)

    var exampleplace = PIAPlace(name: "Example Place")
    exampleplace.placecolor = PlaceColor.green.rawValue
    
    container.mainContext.insert(exampleplace)
    
    var exampleitem1 = PIAItem(place: exampleplace, itemname: "Example Item one")
    exampleplace.items.append(exampleitem1)

    var exampleitem2 = PIAItem(place: exampleplace, itemname: "Example Item two")
    exampleplace.items.append(exampleitem2)

    
    return NavigationStack {
        PlaceView(currentplace: exampleplace)
            .modelContainer(container)
    }
}
