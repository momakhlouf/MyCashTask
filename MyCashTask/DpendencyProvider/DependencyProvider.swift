//
//  DependencyProvider.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 10/01/2024.
//

import Foundation

class DependencyProvider{
    static var service: ServiceProtocol{
        return Service()
    }
    
    static var popularSellersViewModel: PopularSellersViewModel{
        return PopularSellersViewModel(service: service)
    }
    
    static var categoriesViewModel: CategoriesViewModel{
        return CategoriesViewModel(service: service)
    }
    
    static var trendingViewModel: TrendingSellersViewModel{
        return TrendingSellersViewModel(service: service)
    }
    
    static var profileViewModel: ProfileViewModel{
        return ProfileViewModel(service: service)
    }
    
    static var signInViewModel: SignInViewModel{
        return SignInViewModel(service: service)
    }
    
    static var signUpViewModel: SignUpViewModel{
        return SignUpViewModel(service: service)
    }


}
