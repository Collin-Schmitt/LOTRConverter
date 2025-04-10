//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Collin Schmitt on 9/7/24.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyImage: ImageResource
    let currencyName: String
    var body: some View {
                // currency icons
                ZStack(alignment: .bottom) {
                    // currency image
                    Image(currencyImage)
                        .resizable()
                        .scaledToFit()
                    
                    // currency name
                    Text(currencyName)
                        .padding(3)
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                        .background(.brown.opacity(0.75))
                }
                .padding(3)
                .frame(width: 100, height: 100)
                .background(.brown)
                .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currencyImage: .goldpiece, currencyName: "Gold Piece")
}
