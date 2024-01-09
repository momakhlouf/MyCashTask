//
//  ProfileView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 09/01/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                Text("Just for log out")
                    .font(.headline)
                    .padding()
                
                ImageLoadingView(urlString: viewModel.clientData?.image ?? "", width: 100, height: 100)
                    .clipShape(Circle())
                Text(viewModel.clientData?.name.capitalized ?? "")
                Text(viewModel.clientData?.email ?? "")
                
                Button(action: {
                    UserManager.shared.clearToken()
                    withAnimation {
                        viewModel.isNotAuthenticated = true
                    }
                }, label: {
                    Text("Log Out")
                        .modifier(SignButtonModifier())
                })
                .padding()
                .navigationDestination(isPresented: $viewModel.isNotAuthenticated) {
                    SignInView()
                        .navigationBarBackButtonHidden(true)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    BackButton()
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
