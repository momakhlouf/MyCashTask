//
//  BackButton.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 09/01/2024.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Image(systemName: "chevron.left")
            .imageScale(.large)
            .foregroundStyle(.customYellow)
            .onTapGesture {
                dismiss()
            }
    }
}

#Preview {
    BackButton()
}
