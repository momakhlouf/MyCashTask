//
//  SignUpFormView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 09/01/2024.
//

import SwiftUI

struct SignUpFormView: View {
    @StateObject var viewModel: SignUpViewModel
    
    init(viewModel: SignUpViewModel){
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
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
            
            VStack(alignment: .leading, spacing: 6){
                textFieldTitle(text: "Name")
                TextField("Write 14 character", text: $viewModel.name)
                    .modifier(TextFieldModifier())
                
                textFieldTitle(text: "Email")
                TextField("Write your email", text: $viewModel.email)
                    .modifier(TextFieldModifier())
                    .keyboardType(.emailAddress)
                
                textFieldTitle(text: "Phone Number")
                TextField("Write your Number", text: $viewModel.phone)
                    .modifier(TextFieldModifier())
                    .keyboardType(.numberPad)
                  
                textFieldTitle(text: "Password")
                SecureField("Write 8 character at least", text: $viewModel.password)
                    .modifier(TextFieldModifier())
                
                textFieldTitle(text: "Confirm Password")
                SecureField("Write your password again", text: $viewModel.confirmPassword)
                    .modifier(TextFieldModifier())
               
                if !viewModel.passwordsMatch {
                    Text("Passwords don't match")
                        .foregroundStyle(.red)
                        .font(.caption)
                        .opacity(viewModel.confirmPassword.isEmpty || viewModel.password.isEmpty ? 0.0 : 1.1)
                }else{
                    Text(" ")
                        .font(.caption)
                }
            }
            VStack{
                Button(action: {
                    viewModel.signUP()
                }, label: {
                    Text("Sign Up")
                        .modifier(SignButtonModifier())
                })
                .padding(.horizontal ,20)
                .disabled(!viewModel.passwordsMatch)
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Message"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
                }
                .navigationDestination(isPresented: $viewModel.isAuthenticated) {
                    HomeView(viewModel: DependencyProvider.profileViewModel)
                        .navigationBarBackButtonHidden(true)
                }
                
                NavigationLink {
                    SignInView()
                        .navigationBarBackButtonHidden(true)
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
                .padding()
            }
        }
        .padding([.horizontal, .bottom])
        .background{
            //Color.white
            UnevenRoundedRectangle(topLeadingRadius: 40, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 40, style: .continuous)
                .foregroundStyle(Color.white)
        }
        .overlay{
            if viewModel.isLoading{
                ProgressView()
            }
        }
    }
    
}

#Preview {
    SignUpFormView(viewModel: DependencyProvider.signUpViewModel)
}

extension SignUpFormView{
    func textFieldTitle(text: String) -> some View{
        Text(text)
            .font(.system(size: 15))
            .foregroundStyle(.customGray)
    }
}
