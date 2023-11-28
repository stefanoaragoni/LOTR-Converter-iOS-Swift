//
//  Currency.swift
//  LOTRConverter
//
//  Created by Stefano Aragoni on 27/11/23.
//

import SwiftUI

// CaseIterable: A type that provides a collection of all of its values.
    // Allows to be iterable within a ForEach loop

// Identifiable: A class of types whose instances hold the value of an entity with stable identity.
    // Necessary for using in a loop. Each element must have an ID.

enum Currency: Double, CaseIterable, Identifiable {
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var id: Double { rawValue }     // Stores the ID (6400, 64, 16, 4, or 1) as an identifier
    
    var image: ImageResource{
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
    
    var name: String{
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
    
    
    // _ allows to not have to use the name of the parameter when calling, to allows a custom name when calling
    func convert(_ amountString: String, to currency: Currency) -> String {
        
        guard let doubleAmount = Double(amountString) else { return "" }
        
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        return String(format: "%.2f", convertedAmount)
    }
    
}
