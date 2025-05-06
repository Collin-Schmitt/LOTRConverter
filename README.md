# 🪙 LOTR Converter

**LOTR Converter** is a fun, beginner SwiftUI app that allows users to convert between fictional currencies from the world of *The Lord of the Rings*.

---

## ✨ Features

- 🧮 Convert between 5 Middle-earth currencies:
  - Copper Penny
  - Silver Penny
  - Silver Piece
  - Gold Penny
  - Gold Piece
- 🔄 Real-time currency conversion with input from either side
- 🧠 Currency conversion logic handled using Swift Enums and `rawValue`
- 🎨 Themed interface with custom icons and parchment-style backgrounds
- 💬 Informational popovers using **TipKit**
- 📜 “Exchange Info” sheet that explains the lore and conversion rules
- 📱 Fully built with SwiftUI and designed to run on iOS

---

## 🛠️ Technologies Used

- Swift 6
- SwiftUI
- Xcode 15+
- TipKit
- SF Symbols
- Custom asset catalog images

---

## 🧭 How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/Collin-Schmitt/LOTRConverter.git
2. Open the project in Xcode
3. Run the project on a simulator or physical iOS device (iOS 17+ recommended)

---

## 📁 Project Structure
- ContentView.swift – Main UI with currency input fields and live conversion
- Currency.swift – Enum that defines currencies and their conversion logic
- CurrencyIcon.swift – Reusable view for displaying currency visuals
- ExchangeInfo.swift – Sheet with fictional exchange rate lore
- ExchangeRate.swift – Helper view for displaying one rate line
- IconGrid.swift – Grid layout to pick currencies
- SelectCurrency.swift – Sheet for selecting base and target currencies
- CurrencyTip.swift – TipKit configuration for user guidance

---

## 📸 Screenshots
### Main Screen with TipKit  
<img src="Screenshots/Main%20Screen%20w:%20TipKit.png" alt="Main Screen" height="400"/>

### Select Currency Screen  
![Select Currency](Screenshots/Select%20Currency%20Screen.png)

### Exchange Rates Page  
![Exchange Info](Screenshots/ExchangeRates%20Page.png)

### Currency Conversion Example  
![Conversion](Screenshots/Currency%20Conversion%20.png)


---

## 🙌 Acknowledgments
- Inspired by the world of J.R.R. Tolkien
- Built as a SwiftUI learning project
- Uses Apple’s TipKit for interactive user guidance
