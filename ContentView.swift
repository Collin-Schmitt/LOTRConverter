//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Collin Schmitt on 9/5/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping

    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    let currencyTip = CurrencyTip()

    
    var body: some View {
        ZStack {
            //Background image goes here
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                //prancing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                //Currency Exchange Text here
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                //conversion section
                HStack{
                    //left conversion section
                    VStack{
                        //currency
                        HStack{
                            //Currency Image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //currency Text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                            
                        //text field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                        
                        
                    }
                    
                    //Equal Sign (sf symbol, so need systemName: "nameOfSymbol"
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white) //can treat SF symbols as text OR image
                        .symbolEffect(.pulse)
                    //Right Conversion Section
                    VStack{
                        //currency
                        HStack{
                            //Currency Text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            //currency Image
                            Image(rightCurrency.image.self)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        
                        
                        //text field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .keyboardType(.decimalPad)

                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                Spacer()
                
                //Info Button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                        print("showExchangeInfo value: \(showExchangeInfo)")
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
            .task{
                try? Tips.configure()
            }
            //if left side textbox changes
            .onChange(of: leftAmount){
                if leftTyping {
                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                }
            }
            //if right side textbox changes
            .onChange(of: rightAmount){
                if rightTyping {
                    leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                }
            }
            //if left currency is changed
            .onChange(of: leftCurrency){
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
            //if right currency is changed
            .onChange(of: rightCurrency){
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }

            .sheet(isPresented: $showExchangeInfo){
                ExchangeInfo()
            }
            .sheet(isPresented: $showSelectCurrency){
                SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
            }
        }
                
                
    }
}

#Preview {
    ContentView()
}
