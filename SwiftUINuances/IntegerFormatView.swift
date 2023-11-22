//
//  IntegerFormatView.swift
//  SwiftUINuances
//
//  Created by Lenabalakumar Subbarayan on 22/11/2023.
//

import SwiftUI

struct IntegerFormatView: View {
    let pi = Double.pi
    let nums = [100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000]
    let kilometersRunByMe = 14
    var kilometersInMeasurement: Measurement<UnitLength> {
        Measurement(value: Double(kilometersRunByMe), unit: UnitLength.kilometers)
    }
    var formatterNumbers: String {
        let formatted = nums.formatted(.list(memberStyle: .currency(code: "USD"), type: .and).locale(Locale(identifier: "en_US")))
        return String(formatted)
    }
    let names = ["Megan", "Susan", "Mike", "John"]
    var formattedNames: String {
        return String(names.formatted(.list(type: .and, width: .short)))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                Section("PI in swift") {
                    Text(pi, format: .number)
                }
                Section("Measurement style") {
                    Text(kilometersInMeasurement, format: .measurement(width: .narrow, usage: .asProvided))
                }
                Section("Formatted numbers") {
                    Text(formatterNumbers)
                }
                Section("Formatted Names") {
                    Text(formattedNames)
                }
                Section("Compact name modifier") {
                    ForEach(nums, id: \.self) { num in
                        Text(num, format: .number.notation(.compactName))
                    }
                }
                Section("Always style modifier") {
                    ForEach(nums, id: \.self) { num in
                        Text(num, format: .number.decimalSeparator(strategy: .always))
                    }
                }
                Section("Never style modifier") {
                    ForEach(nums, id: \.self) { num in
                        Text(num, format: .number.grouping(.never))
                    }
                }
                Section("German style modifier") {
                    ForEach(nums, id: \.self) { num in
                        Text(num, format: .number.locale(Locale(identifier: "DE")).notation(.compactName))
                    }
                }
                Section("Scientific style modifier") {
                    ForEach(nums, id: \.self) { num in
                        Text(num, format: .number.notation(.scientific))
                    }
                }
                Section("Precision style modifier") {
                    ForEach(nums, id: \.self) { num in
                        Text(num, format: .number.precision(.significantDigits(1...4)))
                    }
                }
            }
            .listStyle(.automatic)
        }
    }
}

struct IntegerFormatView_Previews: PreviewProvider {
    static var previews: some View {
        IntegerFormatView()
    }
}
