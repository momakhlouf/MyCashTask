//
//  SignInFormView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 09/01/2024.
//

import SwiftUI

struct SignInFormView: View {
    @StateObject var viewModel = SignInViewModel()
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
                
                TextField("Write your email", text: $viewModel.email)
                    .modifier(TextFieldModifier())
                    .keyboardType(.emailAddress)
                
                
                Text("Password")
                    .foregroundStyle(.customGray)
                
                SecureField("Write 8 character at least", text: $viewModel.password)
                    .modifier(TextFieldModifier())
            }
            
            HStack{
                Text("Forget the password ?")
                    .font(.caption)
                    .foregroundStyle(.gray)
                Spacer()
            }
            .padding(3)
            Button(action: {
                viewModel.signIn()
            }, label: {
                Text("Log In")
                    .modifier(SignButtonModifier())
            })
            .padding(30)
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Message"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
            }
            .navigationDestination(isPresented: $viewModel.isAuthenticated) {
                HomeView()
                    .navigationBarBackButtonHidden(true)
            }
            
         
            
            NavigationLink {
                SignUpView()
                    .navigationBarBackButtonHidden(true)
                
            } label: {
                HStack(spacing: 2){
                    Text("Don't have an account?")
                        .foregroundStyle(Color.gray)
                    Text("Sign Up")
                        .foregroundStyle(Color.customGreen)
                        .fontWeight(.bold)
                }
                .font(.caption)
                .padding(.bottom, 20)
            }
        }
        .padding([.horizontal, .bottom])
        .background{
            UnevenRoundedRectangle(topLeadingRadius: 40, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 40, style: .continuous)
                .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    SignInFormView()
}
