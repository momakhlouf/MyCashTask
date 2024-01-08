//
//  SectionHeaderView.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import SwiftUI

struct SectionHeaderView<Destination>: View where Destination: View {
    
    let title: String
    let destination: () -> Destination
    
    init(title: String, @ViewBuilder destination: @escaping () -> Destination) {
        self.title = title
        self.destination = destination
    }
    var body: some View {
        HStack{
            Text(title)
                .foregroundStyle(Color.customGray)
                .font(.subheadline)
            Spacer()
            NavigationLink(destination: destination){
                HStack{
                    Text("View all")
                  //  Image(systemName: "chevron.right")
                }
                .foregroundStyle(.customYellow)
                .font(.system(size: 15))
                .underline()

            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    SectionHeaderView(title: "Categories", destination: {})
}
