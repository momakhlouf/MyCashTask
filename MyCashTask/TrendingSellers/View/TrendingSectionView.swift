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

#Preview {
    TrendingSectionView(trendingSellers: [])
}
