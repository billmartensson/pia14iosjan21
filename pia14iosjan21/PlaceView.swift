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
                        .prettyTextfield(headertext: "Name")
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
                        .prettyTextfield(headertext: "Add item")
                    
                    Button("Add") {
                        let newitem = PIAItem(place: currentplace, itemname: additem, itemamount: 1)
                        currentplace.items.append(newitem)
                        modelContext.insert(newitem)
                    }
                }
                .padding(.horizontal, 16)
                
                List {
                    ForEach(currentplace.items) { item in
                            HStack {
                                Text(item.itemname)
                                
                                Spacer()
                                
                                Text("\(item.itemamount)")
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 20))
                            }
                            .background(
                                NavigationLink("", destination: ItemView(currentitem: item))
                            )
                        
                    }
                }
                .listStyle(.inset)
            }
            .onAppear() {
                editname = currentplace.name
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        deleteitem()
                    }) {
                        Image(systemName: "trash")
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
            
        }
    }
}

#Preview {
    
    return NavigationStack {
        PlaceView(currentplace: PIACode.getExamplePlace())
            .modelContainer(PIACode.getExampleContainer())
    }
}
