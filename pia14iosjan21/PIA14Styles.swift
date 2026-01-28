//
//  PIA14Styles.swift
//  pia14iosjan21
//
//  Created by BillU on 2026-01-28.
//

import Foundation
import SwiftUI
import Playgrounds

struct FancyTextfield : ViewModifier {
    var headertext : String
    
    var thecolor = Color.white
    
    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(headertext)
                .padding(.leading, 20)
            content
                .frame(height: 40)
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(thecolor)
                        .stroke(Color.black, lineWidth: 5)
                )
        }

    }
    
}


extension View {
    func prettyTextfield(headertext : String) -> some View {
        modifier(FancyTextfield(headertext: headertext))
    }
    func prettyTextfield(headertext : String, thecolor : Color) -> some View {
        modifier(FancyTextfield(headertext: headertext, thecolor: thecolor))
    }
}


#Preview {
    VStack {
        TextField("", text: .constant("Massa text"))
            .prettyTextfield(headertext: "Ange namn")
        
        TextField("", text: .constant("Massa text"))
            .prettyTextfield(headertext: "Ange address", thecolor: Color.yellow)
    }
}






extension String {
    var shorter: String {
        guard let endPosition = self.firstIndex(of: ".") else {
            return self
        }
        
        return String(self[...endPosition])
    }
}

extension Int {
    var isEven: Bool {
        isMultiple(of: 2)
    }
    
    var makeVeryBig : Int {
        return self * 2563
    }
}


#Playground {
    var siffra = 4
    var checksiffra = siffra.isEven
    var largenumber = 5.makeVeryBig
    
    var mytext = "Hej och välkommen. Detta är mer text. Även ytterligare text.".shorter
}


protocol Musthavename {
    var firstname : String { get }
    var lastname : String { get }
    var address : String { get }
}

