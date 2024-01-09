//
//  HomeView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

#warning("DI, progress view")

import SwiftUI

struct HomeView: View {
    @StateObject private var popularSellersViewModel = PopularSellersViewModel()
    @StateObject private var trendingSellersViewModel = TrendingSellersViewModel()
    @StateObject private var categoriesViewModel = CategoriesViewModel()
    @StateObject private var profileViewModel = ProfileViewModel()
    
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
    HomeView()
}

extension HomeView{
    var searchBar: some View{
        HStack(spacing: 8){
            SearchBarView(searchText: $popularSellersViewModel.searchText)
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
            if categoriesViewModel.categories.count > 0{
                SectionHeaderView(title: "Categories") {
                    Text("A list of categories view")
                }
            }
            CategoriesSectionView(categories: categoriesViewModel.categories)
            
            
            if popularSellersViewModel.filteredPopularSeller.count > 0{
                SectionHeaderView(title: "Popular Now") {
                    Text("A list of popular restaurants view")
                    
                }
            }
            PopularSectionView(popularSellers: popularSellersViewModel.filteredPopularSeller)
            
            
            if trendingSellersViewModel.trendingSellers.count > 0{
                SectionHeaderView(title: "Trending Now") {
                    Text("A list of trending restaurants view")
                }
            }
            TrendingSectionView(trendingSellers: trendingSellersViewModel.trendingSellers)
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
                ProfileView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Label("Setting", systemImage: "rectangle.grid.1x2")
            }
        }
        .foregroundStyle(.customYellow)
        .fontWeight(.bold)
    }
}
