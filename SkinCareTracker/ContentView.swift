//
//  ContentView.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewRouter: ViewRouter
    @StateObject var productListViewModel: ProductListViewModel
    var body: some View {
        switch viewRouter.currentPage {
        case .home:
            HomePageView(viewRouter: viewRouter)
        case .list:
            ProductListView(viewRouter: viewRouter, productListModel: productListViewModel)
        case .profile:
            ProfileView(viewRouter: viewRouter)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter(), productListViewModel: ProductListViewModel())
    }
}
