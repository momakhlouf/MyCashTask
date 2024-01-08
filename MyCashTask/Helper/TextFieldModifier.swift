//
//  TextFieldModifier.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 07/01/2024.
//

import Foundation
import SwiftUI

struct TextFieldModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.black)
            .frame(height: 54)
            .padding(.leading)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
    }
}
