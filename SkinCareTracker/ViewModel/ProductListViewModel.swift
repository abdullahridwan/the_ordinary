//
//  ProductListViewModel.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/29/21.
//

import Foundation
import UIKit

struct Product: Hashable{
    var name: String!
    var frequency: String?
    var dayOrNight: String?
    var image: UIImage?
}


final class ProductListViewModel: ObservableObject {
    @Published var productList: [Product]
    
    //INIT FOR TESTING
    init(){
        var arr  = [Product]()
        let p1 = Product(name: "NMFHA", frequency: "Mon Tue", dayOrNight: "Day", image: UIImage(named: "rdn-natural-moisturizing-factors-ha-30ml"))
        let p2 = Product(name: "Niacinamide", frequency: "Mon Tues Wed", dayOrNight: "Night", image: UIImage(named: "rdn-niacinamide-10pct-zinc-1pct-30ml"))
        let p3 = Product(name: "No Image Item", frequency: "Mon Tues Wed", dayOrNight: "Night")
        arr.append(p1)
        arr.append(p2)
        arr.append(p3)
        self.productList = arr
    }
    func addProduct(p: Product){
        self.productList.append(p);
    }
}
