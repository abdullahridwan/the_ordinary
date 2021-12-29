//
//  ProductDetailsViewModel.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/29/21.
//

import Foundation
import SwiftUI



class ProductDetailsViewModel: ObservableObject {
    @Published var name: String
    @Published var image: Image
    @Published var details: String
    
    init(name: String, image: Image){
        self.name = name
        self.image = image
        self.details = ""
    }
    
    func get_details(name: String ) -> String {
        //Need to make some osrt of api or something bc this is getting ridiculous
        //Description section and Uses section? idk yet tbh
        return "Info on this item coming soon! 🎉"
    }
    
    
    
    
}
