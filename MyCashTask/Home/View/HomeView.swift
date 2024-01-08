//
//  HomeView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

#warning("Enhance the shadow, the sizes , auth, sing in and sign up view , DI")

import SwiftUI

struct HomeView: View {
    @StateObject private var popularSellersViewModel = PopularSellersViewModel()
    @StateObject private var trendingSellersViewModel = TrendingSellersViewModel()
    @StateObject private var categoriesViewModel = CategoriesViewModel()
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(spacing: 15){
                    // will be personal data section
                    HStack{
                        VStack(alignment: .leading, spacing: 0){
                            Text("Hello name")
                                .font(.system(.headline, design: .rounded, weight: .semibold))
                            Text("address bla bla")
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    
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
                
            } label: {
                Label("Cart", systemImage: "cart")
            }
            
            Button{
                
            }label: {
                Label("Setting", systemImage: "rectangle.grid.1x2")
            }
        }
        .foregroundStyle(.customYellow)
        .fontWeight(.bold)
    }
}
