//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Collin Schmitt on 9/7/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency

    
    var body: some View {
        ZStack {
            //Parchment background img
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                //TEXT
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    
                IconGrid(currency: $topCurrency)
                
                //text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                
                //currency icons
                IconGrid(currency: $bottomCurrency)

                //Done button
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .silverPenny
    @Previewable @State var bottomCurrency: Currency = .goldPenny

    
    SelectCurrency( topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}
