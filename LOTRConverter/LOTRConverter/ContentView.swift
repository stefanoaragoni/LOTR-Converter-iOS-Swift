//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Stefano Aragoni on 26/11/23.
//

import SwiftUI

struct ContentView: View {
    
    // Stored property
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    var body: some View {
        ZStack{
            
            // Background image
            Image(.background)
                .resizable()            // resizes an image to fit its space
                .ignoresSafeArea()      // expands the view out of its safe area
                
            
            // Prancing pony view
            VStack{
                
                Spacer()
                
                // Pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()      // kepps this view’s aspect ratio
                    .frame(height: 200) // changes size of the image (via the size of the frame)
                
                
                // Currency Exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)          // change weight of font
                    .foregroundStyle(.white)    // change color of text
                
                // Currency conversion selection
                HStack{
                    
                    // Left conversion
                    VStack{
                        
                        // Currency
                        HStack{
                            
                            // Currency image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Image text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -3)           // Brings elements together
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        // Text field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)                 // When not typing, don't change the other amount
                            .onChange(of: leftAmount){
                                if leftTyping {
                                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                                }
                            }
                            .keyboardType(.decimalPad)              // Changes keyboard to decimalpad
                            
                    }
                    
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)          // Font can be used with SF Symbols
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                        
                    
                    // right conversion
                    VStack{
                        
                        // Currency
                        HStack{
                            
                            // Currency text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // image image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -3)           // Brings elements together
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        // text field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)          // Allows the text to be left justified
                            .focused($rightTyping)                     // When not typing, don't change the other amount
                            .onChange(of: rightAmount){
                                if rightTyping {
                                    leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                                }
                                
                            }
                            .keyboardType(.decimalPad)              // Changes keyboard to decimalpad
                    }
                }
                .padding()
                .background(.black.opacity(0.5))         // Adds background to HStack


                
                Spacer()
                
                // Info button
                HStack{
                    Spacer()
                    
                    // showExchangeInfo Button
                    Button{
                        showExchangeInfo.toggle()
                    } label : {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                }
                
            }
            .onChange(of: leftCurrency){         // When changing a currency, the amount is updated
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
            .onChange(of: rightCurrency){
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
            .sheet(isPresented: $showSelectCurrency) {
                SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
            }
        }
    }
    
}

#Preview {
    ContentView()
}
