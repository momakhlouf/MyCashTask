//
//  HomeView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import SwiftUI

struct HomeView: View {
      
    @StateObject private var profileViewModel: ProfileViewModel
    @State var searchText: String = ""
    
       init(viewModel: ProfileViewModel) {
           _profileViewModel = StateObject(wrappedValue: viewModel)

       }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(spacing: 15){
                    personalData
                    searchBar
                    sections
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem {
                    navigationItems
                }
            }
        }
    }
}

#Preview {
    HomeView(viewModel: DependencyProvider.profileViewModel)
}

extension HomeView{
    var searchBar: some View{
        HStack(spacing: 8){
            SearchBarView(searchText: $searchText)
            Button{
                // for search or focus on searchbar
            }label: {
                RoundedRectangle(cornerRadius: 13)
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.customYellow)
                    .overlay{
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 18, height: 16)
                            .foregroundStyle(.white)
                    }
            }
            Button(action: {
                //FOR FILTERING DATA
            }, label: {
                Image(systemName: "slider.horizontal.3")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.customYellow)
            })
        }
        .padding(.horizontal, 20)
    }
    
    var personalData: some View{
        HStack{
            VStack(alignment: .leading, spacing: 0){
                if let clientName = profileViewModel.clientData?.name{
                    Text( "Hello, \(clientName.capitalized)")
                        .font(.system(.headline, design: .rounded, weight: .semibold))
                        .foregroundStyle(.customGray)
                }
            }
            Spacer()
        }
        .padding(.horizontal)
    }
    var sections: some View{
        VStack(spacing: 15){
            CategoriesSectionView(viewModel: DependencyProvider.categoriesViewModel)
            PopularSectionView(viewModel: DependencyProvider.popularSellersViewModel)
            TrendingSectionView(viewModel: DependencyProvider.trendingViewModel)
        }
    }
    var navigationItems: some View{
        HStack{
            Button {
                // for cart view
            } label: {
                Label("Cart", systemImage: "cart")
            }
            
            NavigationLink {
                ProfileView(viewModel: DependencyProvider.profileViewModel)
                    .navigationBarBackButtonHidden(true)
            } label: {
                Label("Setting", systemImage: "rectangle.grid.1x2")
            }
        }
        .foregroundStyle(.customYellow)
        .fontWeight(.bold)
    }
}
