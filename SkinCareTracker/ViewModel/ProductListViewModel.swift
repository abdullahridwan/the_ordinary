//
//  ProductListViewModel.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/29/21.
//

import Foundation
import UIKit
import CoreData

struct Product: Hashable{
    var id = UUID()
    var name: String!
    var frequency: String?
    var dayOrNight: String?
    var image: UIImage?
}


final class ProductListViewModel: ObservableObject {
    @Published var productList: [Product] = []
    
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
    
    func getAllProducts(){
        let products = CoreDataManager.shared.getAllProducts().map({ (pd) -> Product in
            return Product(name: pd.name, frequency: pd.frequency, dayOrNight: pd.dayOrNight)
        })
        self.productList = products
    }
    
    func addProduct(p: Product){
        //self.productList.append(p);
        let p2s = ProductData(context: CoreDataManager.shared.persistentContainer.viewContext)
        p2s.name = p.name
        p2s.frequency = p.frequency
        p2s.dayOrNight = p.dayOrNight
        CoreDataManager.shared.save()
    }
    
    
    func updateProduct(){
        
    }
    
    func deleteProductp(p: Product){
        //Check if the object exists
        CoreDataManager.shared.getProductDataByID(id: p.id)
        
        //get the NSManagedObject based on Product
    }
    
    
}
