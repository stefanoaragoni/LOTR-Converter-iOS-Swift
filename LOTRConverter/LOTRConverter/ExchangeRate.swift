//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Stefano Aragoni on 27/11/23.
//

import SwiftUI

struct ExchangeRate: View {
    
    let leftImage: ImageResource
    let rightImage: ImageResource
    
    let textConversion: String
    
    var body: some View {
        HStack{
            
            // Left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange rate text
            Text(textConversion)
            
            // Right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}
