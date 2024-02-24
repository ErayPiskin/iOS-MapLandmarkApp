//
//  swiftfulMapAppApp.swift
//  swiftfulMapApp
//
//  Created by mustafa eray Pişkin on 19.02.2024.
//

import SwiftUI

@main
struct swiftfulMapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
