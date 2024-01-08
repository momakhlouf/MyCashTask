//
//  HomeViewModel.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject{
 
    @Published var searchText: String = ""
    var cancellables = Set<AnyCancellable>()
    
    
}
