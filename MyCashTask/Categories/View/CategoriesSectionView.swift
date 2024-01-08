//
//  CategoriesSectionView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import SwiftUI

struct CategoriesSectionView: View {
    let categories: [Category]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(alignment: .top){
                ForEach(categories){ category in
                    VStack(spacing: 0){
                        HStack{
                            Spacer()
                            ImageLoadingView(urlString: category.image , width: 70, height: 70)
                        }
                        HStack{
                            Text(category.nameEn.capitalized)
                                .font(.caption)
                                .foregroundStyle(.customGray)
                            Spacer()
                        }
                        
                    }
                    .padding()
                    .frame(width:130,height: 100)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 1 , x: 0.0 , y: 1)
                    .padding(.bottom, 5)
                }
            }

        }
    }
}

#Preview {
    CategoriesSectionView(categories: [])
}
