//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Stefano Aragoni on 27/11/23.
//

import SwiftUI

struct IconGrid: View {
    
    @State var currency: Currency
    
    var body: some View{
        
        // Currency icons
        LazyVGrid( columns: [GridItem(), GridItem(), GridItem()]){
            
            // Loop to fill the 3 column grid
            ForEach(Currency.allCases) { currency in
                
                if self.currency == currency {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)            // Creates a shadow around a Currency Icon
                        .overlay {                                   // Adds a black line on top
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                }
                
                else {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            self.currency = currency              // onTapGesture allows to tap on things
                        }
                }
            }
            
        }
    }
}

#Preview {
    IconGrid(currency: .silverPenny)
}
