//
//  SignUpView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 07/01/2024.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image(.yajhzBackground)
                    .resizable()
                VStack{
                    Spacer()
                    Image(.yajhzBrand)
                         Spacer()
                    SignUpFormView()
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SignUpView()
}


