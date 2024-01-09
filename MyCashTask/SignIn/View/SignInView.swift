//
//  SignInView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 07/01/2024.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image(.yajhzBackground)
                    .resizable()
                VStack{
                    Spacer()
                    Image(.yajhzBrand)
                    Spacer()
                    SignInFormView()
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SignInView()
}


