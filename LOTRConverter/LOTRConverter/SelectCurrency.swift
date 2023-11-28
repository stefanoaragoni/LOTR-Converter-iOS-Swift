//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Stefano Aragoni on 27/11/23.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var topCurrency: Currency
    @State var bottomCurrency: Currency
    
    
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
                IconGrid(currency: topCurrency)
                
                // Text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top, 30.0)
                
                // Currency icons
                IconGrid(currency: bottomCurrency)
                
                
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
    SelectCurrency(topCurrency: .silverPiece, bottomCurrency: .goldPiece)
}
