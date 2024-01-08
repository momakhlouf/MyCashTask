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
            GeometryReader{ geo in
                ZStack{
                    Image(.yajhzBackground)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()

                    
                    VStack{
                        // Spacer()
                        Image(.yajhzBrand)
                            .resizable()
                            .frame(width: geo.size.width/2, height: geo.size.height/6)
                        // Spacer()
                        SignInFormView()
                            .frame(width: geo.size.width, height: geo.size.height)
                    }
                }
            }
        }
    }
}

#Preview {
    SignInView()
}

struct SignInFormView: View {
    @State var name: String = ""
    var body: some View {
        VStack{
            UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 40, bottomTrailingRadius: 40, topTrailingRadius: 0, style: .continuous)
                .frame(width: 165, height: 60)
                .foregroundStyle(.white)
                .overlay {
                    Text("LOG IN")
                        .font(.headline)
                        .foregroundStyle(.customGray)
                }
                .shadow(radius: 50)
            
            VStack(alignment: .leading, spacing: 8){
                
                Text("Email")
                    .foregroundStyle(.customGray)
                
                TextField("Write your email", text: $name)
                    .modifier(TextFieldModifier())
                    .keyboardType(.emailAddress)
                
                
                Text("Password")
                    .foregroundStyle(.customGray)
                
                SecureField("Write 8 character at least", text: $name)
                    .modifier(TextFieldModifier())
            }
            Button(action: {
                
            }, label: {
                Text("Log in")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 51)
                    .background{
                        Color(.signButton)
                    }
                    .cornerRadius(12)
            })
            .padding(20)
            
            NavigationLink {
                SignUpView()
                    .navigationBarBackButtonHidden(true)

            } label: {
                HStack(spacing: 2){
                    Text("Don't have an account?")
                        .foregroundStyle(Color.gray)
                    Text("Login")
                        .foregroundStyle(Color.signButton)
                        .fontWeight(.bold)
                }
                .font(.caption)
                
            }
            .padding()
                #warning ("back button and corner radius")
           // .navigationBarBackButtonHidden()
            
        }
        .padding([.horizontal, .bottom])
        .background(Color.white)
    }
}
