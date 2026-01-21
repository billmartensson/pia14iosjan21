//
//  PIAPlace.swift
//  pia14iosjan21
//
//  Created by BillU on 2026-01-21.
//

import Foundation
import SwiftData
import SwiftUI

enum PlaceColor: Int {
    case red = 0
    case green = 1
    case blue = 2
}


@Model
final class PIAPlace {
    var name: String
    
    @Relationship(deleteRule: .cascade) var items: [PIAItem] = []
    
    var placetext: String?
    var placecolor: Int?
    
    init(name: String) {
        self.name = name
    }
}

@Model
final class PIAItem {
    var place : PIAPlace

    var itemname: String
    
    init(place: PIAPlace, itemname: String) {
        self.place = place
        self.itemname = itemname
    }
}

