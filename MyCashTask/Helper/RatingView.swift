//
//  RatingView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import SwiftUI

struct RatingView: View {
    @State var rating: Int
    var body: some View {
        starsView
            .overlay{
                overlayView.mask(starsView)
            }
    }
}

#Preview {
    RatingView(rating: 0)
}

extension RatingView{
    private var starsView: some View{
        HStack(spacing: 1){
            ForEach(1..<6){ index in
                Image(systemName: rating >= index ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(.customLightYellow)
                
                //MARK: - THIS IS FOR INTERACTING BUT DEPEND ON API , WE CAN USE IT IN THE RESTAURANT DETAILS NOT HERE
                
//                    .onTapGesture {
//                        withAnimation(.easeInOut) {
//                            rating = index
//                        }
//                    }
            }
        }
    }
    
    private var overlayView: some View{
        GeometryReader{ geometry in
            ZStack(alignment: .leading){
                Rectangle()
                    .foregroundStyle(.customYellow)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
}
