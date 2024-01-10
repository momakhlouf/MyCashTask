//
//  MyCashTaskApp.swift
//  MyCashTask
//
//  Created by Mohamed Makhlouf Ahmed on 07/01/2024.
//

import SwiftUI
import TipKit

@main
struct MyCashTaskApp: App {
    var body: some Scene {
        WindowGroup {
            if UserManager.shared.isAuthenticated{
                HomeView(viewModel: DependencyProvider.profileViewModel)
            }else{
                SignInView()
            }
        }
    }
}
