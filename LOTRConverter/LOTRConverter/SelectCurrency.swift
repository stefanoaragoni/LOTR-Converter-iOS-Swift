//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Stefano Aragoni on 27/11/23.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var currency: Currency
    
    var body: some View {
        
        ZStack{
            
            // Background parchment image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                
                //Text
                Text("Select the currency you are starting with: ")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
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
                
                // Text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top, 30.0)
                
                // Currency icons
                LazyVGrid( columns: [GridItem(), GridItem(), GridItem()]){
                    
                    // Loop to fill the 3 column grid
                    ForEach(Currency.allCases) { currency in
                        CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                    }
                    
                }
                
                
                // Done button
                // Done button
                Button("Done") {
                    dismiss()                           // Dismisses the view
                }
                .foregroundStyle(.white)
                .buttonStyle(.borderedProminent)        // Gives button a box around the text
                .tint(.brown)
                .font(.title2)
                .fontWeight(.medium)
                .padding(.top, 30.0)
                
                
            }
            .padding()
            .multilineTextAlignment(.center)
            
            
        }
        
    }
}

#Preview {
    SelectCurrency(currency: .silverPiece)
}
