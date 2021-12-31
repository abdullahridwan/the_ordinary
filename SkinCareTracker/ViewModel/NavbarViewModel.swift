//
//  NavbarViewModel.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/29/21.
//

import Foundation

enum Page{
    case list
    case home
    case profile
}

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}
