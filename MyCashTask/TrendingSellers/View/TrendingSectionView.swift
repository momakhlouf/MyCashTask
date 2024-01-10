//
//  TrendingSectionView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import SwiftUI

struct TrendingSectionView: View {

    @StateObject private var viewModel: TrendingSellersViewModel

    init(viewModel: TrendingSellersViewModel){
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack{
            if viewModel.trendingSellers.count > 0{
                SectionHeaderView(title: "Trending Now") {
                    Text("A list of trending restaurants view")
                }
            }
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(alignment: .top){
                    ForEach(viewModel.trendingSellers){ restaurant in
                        VStack(spacing: 0){
                            ImageLoadingView(urlString: restaurant.image ?? "", width: 64, height: 51)
                        }
                        .frame(width:136,height: 109)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 0)
                        .padding(.bottom)
                        // .padding(5)
                    }
                }
                
            }
        }
    }
}

#Preview {
    TrendingSectionView(viewModel: DependencyProvider.trendingViewModel)
}
