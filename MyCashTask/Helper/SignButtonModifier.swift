//
//  SignButtonModifier.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 09/01/2024.
//

import Foundation
import SwiftUI

struct SignButtonModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity)
            .frame(height: 51)
            .background{
                Color(.customGreen)
            }
            .cornerRadius(12)
            
    }
}
