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
                    
                    ImageLoadingView(urlString:  restaurant.image, width: 168, height: 152)
                        .overlay{
                            VStack(alignment:.leading){
                                favoriteButton(restaurant: restaurant)
                                Spacer()
                                VStack(alignment: .center, spacing: 2){
                                    restaurantName(restaurant: restaurant)
                                    distanceView(restaurant: restaurant)
                                    rateView(restaurant: restaurant)
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

extension PopularSectionView{
    func favoriteButton(restaurant: PopularSeller) -> some View{
        Button(action: {
            //isFavorite.toggle()
        }, label: {
            //  saving fav not working - not in the task, so all now is true
            Image(systemName: restaurant.isFavorite ?? true ? "heart.fill" : "heart")
                .foregroundStyle(.customYellow)
                .padding()
        })
    }
    
    func restaurantName(restaurant: PopularSeller) -> some View{
        Text(restaurant.name)
            .font(.system(size: 16).bold())
    }
    
    func distanceView(restaurant: PopularSeller) -> some View{
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
        .font(.system(size: 10).bold())
    }
    
    func rateView(restaurant: PopularSeller) -> some View{
        HStack(spacing: 2){
            RatingView(rating: Int(restaurant.rate ?? "") ?? 0)
            if let rate = restaurant.rate {
                Text(rate)
                    .font(.system(size: 10))
            }
        }
    }
}
