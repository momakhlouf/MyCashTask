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
                    .scaledToFill()
                    .ignoresSafeArea()

                
                VStack{
                    Image(.yajhzBrand)
                        .resizable()
                        .frame(width: 150, height: 90)
                    SignUpForm()
                        .navigationBarBackButtonHidden(true)

                }
            }
        }
    }
}

#Preview {
    SignUpView()
}

struct SignUpForm: View {
    @State var name: String = ""
    var body: some View {
        VStack{
            
            UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 40, bottomTrailingRadius: 40, topTrailingRadius: 0, style: .continuous)
                .frame(width: 165, height: 60)
                .foregroundStyle(.white)
                .overlay {
                    Text("SIGN UP")
                        .font(.headline)
                        .foregroundStyle(.customGray)
                }
                .shadow(radius: 50)
            
            VStack(alignment: .leading, spacing: 8){
                Text("Name")
                    .foregroundStyle(.customGray)
                TextField("Write 14 character", text: $name)
                    .modifier(TextFieldModifier())
                
                Text("Email")
                    .foregroundStyle(.customGray)

                TextField("Write your email", text: $name)
                    .modifier(TextFieldModifier())
                    .keyboardType(.emailAddress)
                
                Text("phone Number")
                    .foregroundStyle(.customGray)

                TextField("Write your Number", text: $name)
                    .modifier(TextFieldModifier())
                    .keyboardType(.numberPad)
                
                Text("Password")
                    .foregroundStyle(.customGray)

                SecureField("Write 8 character at least", text: $name)
                    .modifier(TextFieldModifier())
                
                Text("Confirm Password")
                    .foregroundStyle(.customGray)

                SecureField("Write your password again", text: $name)
                    .modifier(TextFieldModifier())
            }
            Button(action: {
                
            }, label: {
                Text("Sign Up")
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
            .padding(.horizontal ,20)
            
            NavigationLink {
                SignInView()
            } label: {
                HStack(spacing: 2){
                    Text("Have an account?")
                        .foregroundStyle(Color.gray)
                    Text("Login")
                        .foregroundStyle(Color.brown)
                        .fontWeight(.bold)
                }
                .font(.caption)
                
            }
          //  .padding(.bottom, 10)
            
        }
        .padding([.horizontal, .bottom])
        .background{
            //Color.white
            UnevenRoundedRectangle(topLeadingRadius: 20, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 20, style: .continuous)
                .foregroundStyle(Color.white)
        }
    }
}
