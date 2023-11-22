//
//  CurrencyFormatView.swift
//  SwiftUINuances
//
//  Created by Lenabalakumar Subbarayan on 22/11/2023.
//

import SwiftUI

struct CurrencyFormatView: View {
    let million = 1000000
    var body: some View {
        VStack {
            Text(million, format: .currency(code: "INR"))
            Text(million, format: .currency(code: "USD"))
            Text(million, format: .currency(code: "GBP"))
            Text(million, format: .currency(code: "EUR"))
            Text(million, format: .currency(code: "CAD"))
            Text(million, format: .currency(code: "SGD"))
            Text(million, format: .currency(code: "JPY"))
        }
    }
}

struct CurrencyFormatView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyFormatView()
    }
}
