//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Stefano Aragoni on 27/11/23.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    
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
                    ForEach(0..<5) { _ in
                        Text("hey")
                    }
                    
                    CurrencyIcon(currencyImage: .copperpenny, currencyName: "Copper Penny")
                    CurrencyIcon(currencyImage: .silverpenny, currencyName: "Silver Penny")
                    CurrencyIcon(currencyImage: .goldpenny, currencyName: "Gold Penny")
                    CurrencyIcon(currencyImage: .silverpiece, currencyName: "Silver Piece")
                    CurrencyIcon(currencyImage: .goldpiece, currencyName: "Gold Piece")
                }
                
                // Text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                // Currency icons
                
                
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
                .padding()
                
                
            }
            .padding()
            .multilineTextAlignment(.center)
            
            
        }
        
    }
}

#Preview {
    SelectCurrency()
}
