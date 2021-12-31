//
//  SkinCareTrackerApp.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/29/21.
//

import SwiftUI

@main
struct SkinCareTrackerApp: App {
    @StateObject var viewRouter = ViewRouter()
    @StateObject var productListViewModel = ProductListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter, productListViewModel: productListViewModel)
        }
    }
}
