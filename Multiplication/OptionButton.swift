//
//  OptionButton.swift
//  Multiplication
//
//  Created by Vanüsha on 18.06.2022.
//

import Foundation
import SwiftUI

struct OptionButton: View {
    var number: Int
    var closure: () -> Void
    
    var body: some View {
        Button("\(number)") {
            closure()
        }
        .font(.title2.bold())
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(.red)
        .clipShape(Capsule())
    }
}
