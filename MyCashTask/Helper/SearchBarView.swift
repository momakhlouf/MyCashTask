//
//  SearchBarView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText : String

    var body: some View {
        HStack{
            TextField("Search for food...", text: $searchText)
                .foregroundColor(Color.customGray.opacity(0.8))
                .disableAutocorrection(true)
            
            Button {
                searchText = ""
                UIApplication.shared.endEditing()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(Color.gray)
                    .opacity(searchText.isEmpty ? 0.0 : 1.0)
            }
        }
        .font(.headline)
        .padding()
        .background(
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.white)
            .frame(height: 44)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
        )
       // .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
