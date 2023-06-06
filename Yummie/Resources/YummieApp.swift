//
//  YummieApp.swift
//  Yummie
//
//  Created by Yogesh Patel on 26/05/23.
//

import SwiftUI

@main
struct YummieApp: App {

    @AppStorage("showOnboarding") var showOnboarding: Bool = true

    var body: some Scene {
        WindowGroup {
            if showOnboarding {
                OnboardScreenView(showOnboarding: $showOnboarding)
            }else {
                HomeView()
            }
        }
    }
}
