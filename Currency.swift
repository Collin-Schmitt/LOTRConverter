//
//  Currency.swift
//  LOTRConverter
//
//  Created by Collin Schmitt on 9/7/24.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var id: Currency { self }

    
    var image: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
    
    
    func convert(_ amountString: String, to currency: Currency) -> String {
        
        //converting string to a double
        guard let doubleAmount = Double(amountString) else{
            //if the user types anything other than a number (what do we return if user types other than numbers)
            return ""
        }
        
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        //now we need to put the double into a string and return it back
        return String(format: "%.2f", convertedAmount) //formatting string to 2 decimal places
    }
}
