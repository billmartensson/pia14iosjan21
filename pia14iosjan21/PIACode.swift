//
//  PIACode.swift
//  pia14iosjan21
//
//  Created by BillU on 2026-01-21.
//

import Foundation
import SwiftUI

class PIACode {
    
    
    
    static func getplaceexample() -> PIAPlace {
        
        var exampleplace = PIAPlace(name: "Example place")
        
        return exampleplace
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
