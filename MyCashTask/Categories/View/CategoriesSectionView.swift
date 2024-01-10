//
//  CategoriesSectionView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import SwiftUI

struct CategoriesSectionView: View {
    @StateObject private var viewModel: CategoriesViewModel

    init(viewModel: CategoriesViewModel){
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        VStack{
            if viewModel.categories.count > 0{
                SectionHeaderView(title: "Categories") {
                    Text("A list of categories view")
                }
            }
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(alignment: .top, spacing: 15){
                    ForEach(viewModel.categories){ category in
                        VStack(spacing: 0){
                            HStack{
                                Spacer()
                                ImageLoadingView(urlString: category.image , width: 79, height: 67)
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
                        .cornerRadius(12)
                        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 0)
                        .padding(.bottom, 5)
                    }
                }
                
            }
        }
    }
}

#Preview {
    CategoriesSectionView(viewModel: DependencyProvider.categoriesViewModel)
}
