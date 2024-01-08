//
//  PopularSectionView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import SwiftUI

struct PopularSectionView: View {
    let popularSellers: [PopularSeller]
    @State private var isFavorite: Bool = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(alignment: .top){
                ForEach(popularSellers){ restaurant in
                    
                    ImageLoadingView(urlString:  restaurant.image, width: 160, height: 140)
                        .overlay{
                            VStack(alignment:.leading){
                                Button(action: {
                                    print(isFavorite.description)
                                    isFavorite.toggle()
                                }, label: {
#warning("heart click")
                                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                                        .foregroundStyle(.customYellow)
                                        .padding()
                                    
                                })
                                Spacer()
                                VStack(alignment: .center, spacing: 2){
                                    Text(restaurant.name)
                                        .font(.system(size: 16).bold())
                                    
                                    HStack(spacing: 2){
                                        Image(.mapIcon)
                                            .resizable()
                                            .foregroundStyle(Color.customLightYellow)
                                            .frame(width:8, height:8)
                                        if restaurant.distance == "0"{
                                            Text("N/A")
                                        }else{
                                            Text("\(restaurant.distance ?? "") KM")
                                        }
                                    }
                                    .font(.system(size: 8).bold())
                                    
                                    
                                    
                                    HStack(spacing: 2){
                                        RatingView(rating: Int(restaurant.rate ?? "") ?? 0)
                                        if let rate = restaurant.rate {
                                            Text(rate)
                                                .font(.system(size: 8))
                                        }
                                    }
                                }
                                .padding(5)
                                .foregroundStyle(.customLightYellow)
                                .frame(maxWidth: .infinity)
                                .background{
                                    Color.customGray.opacity(0.5)
                                }
                            }
                        }
                        .cornerRadius(20)
                    
                }
            }
            
        }
    }
}

#Preview {
    PopularSectionView(popularSellers: [])
}
