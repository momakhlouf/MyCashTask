//
//  TrendingSectionView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import SwiftUI

struct TrendingSectionView: View {

    let trendingSellers : [TrendingSeller]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(alignment: .top){
                ForEach(trendingSellers){ restaurant in
                    VStack(spacing: 0){
                        ImageLoadingView(urlString: restaurant.image ?? "", width: 60, height: 60)
                    }
                    .frame(width:120,height: 100)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 1 , x: 0.0 , y: 1)
                    .padding(.bottom)
                   // .padding(5)

                }
            }
            
        }
    }
}

#Preview {
    TrendingSectionView(trendingSellers: [])
}
