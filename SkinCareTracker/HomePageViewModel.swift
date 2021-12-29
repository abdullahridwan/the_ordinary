//
//  HomePageViewModel.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/29/21.
//

import Foundation
import SwiftUI



class HomePageViewModel: ObservableObject {
    @Published var items: [String] = ["rdn-natural-moisturizing-factors-ha-30ml", "rdn-niacinamide-10pct-zinc-1pct-30ml", "rdn-squalane-cleanser-50ml"]
    
    
    
    
    func cleanName(rawName: String) -> String{
        let components = rawName.components(separatedBy: "-");
        var cleanedName = "";
        cleanedName += components[1].capitalized;
        cleanedName += " ";
        cleanedName += components[2].capitalized;
        return cleanedName;
    }
}


