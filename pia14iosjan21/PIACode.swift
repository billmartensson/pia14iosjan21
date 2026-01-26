//
//  PIACode.swift
//  pia14iosjan21
//
//  Created by BillU on 2026-01-21.
//

import Foundation
import SwiftUI
import SwiftData

class PIACode {
    
    
    
    static func getExamplePlace() -> PIAPlace {
        
        let exampleplace = PIAPlace(name: "Example place")

        let exampleitem1 = PIAItem(place: exampleplace, itemname: "Example Item one", itemamount: 1)

        let exampleitem2 = PIAItem(place: exampleplace, itemname: "Example Item two", itemamount: 1)

        exampleplace.items = [exampleitem1, exampleitem2]
        
        return exampleplace
    }
    
    static func getExampleContainer() -> ModelContainer{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: PIAPlace.self, configurations: config)

        return container
    }
    
    static func getExampleItem() -> PIAItem {
        
        let exampleplace = PIAPlace(name: "Example Place")
        
        let exampleitem1 = PIAItem(place: exampleplace, itemname: "Example Item one", itemamount: 1)
        
        return exampleitem1
    }
    
    
    static func getPlaceColor(colornumber : Int?) -> Color {
        switch colornumber {
            case PlaceColor.red.rawValue:
                return Color.red
            case PlaceColor.green.rawValue:
                return Color.green
            case PlaceColor.blue.rawValue:
                return Color.blue
            default:
                return Color.white
        }
    }
    
}
