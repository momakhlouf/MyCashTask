//
//  ImageLoadingView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import SwiftUI

struct ImageLoadingView: View {
    let urlString: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)){ image in
            image
                .resizable()
                .border(Color.white.opacity(0.8))
    
        }placeholder: {
            ProgressView()                
        }
        .frame(width: width, height: height)
    }
}

#Preview {
    ImageLoadingView(urlString: "", width: 1, height: 1)
}
