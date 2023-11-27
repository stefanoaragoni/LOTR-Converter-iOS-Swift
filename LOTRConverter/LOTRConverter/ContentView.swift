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
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Image text
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        
                        // Text field
                        Text("textfield")
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
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // image image
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        
                        // text field
                        Text("Placeholder")
                    }
                }
                
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
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
