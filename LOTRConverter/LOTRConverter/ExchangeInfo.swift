//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by Stefano Aragoni on 26/11/23.
//

import SwiftUI

struct ExchangeInfo: View {
    var body: some View {
        ZStack{
            
            // Background parchment image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.black)
                
            
            VStack{
                
                // Title text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .tracking(2)
                
                // Description text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                
                //Exchange rates
                ExchangeRate(leftImage: .goldpiece, rightImage: .goldpenny, textConversion: "1 Gold Piece = 4 Gold Pennies")
                
                ExchangeRate(leftImage: .goldpiece, rightImage: .silverpenny, textConversion: "1 Gold Piece = 4 Silver Pennies")
                
                ExchangeRate(leftImage: .silverpiece, rightImage: .silverpenny, textConversion: "1 Silver Piece = 4 Silver Pennies")
                
                ExchangeRate(leftImage: .silverpiece, rightImage: .copperpenny, textConversion: "1 Silver Piece = 100 Copper Pennies")
                
                
                
                
                // Done button
                Button("Done") {
                    
                }
                .foregroundStyle(.white)
                .buttonStyle(.borderedProminent)        // Gives button a box around the text
                .tint(.brown)
                .font(.title2)
                .fontWeight(.medium)
                .padding()
                
            }
            .padding()
            .foregroundStyle(.black)
            
            
            
        }
    }
}

#Preview {
    ExchangeInfo()
}
