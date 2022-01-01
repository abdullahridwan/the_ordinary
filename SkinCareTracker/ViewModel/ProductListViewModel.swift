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
    var id : UUID
    var name: String!
    var frequency: String?
    var dayOrNight: String?
    var image: UIImage?
}



final class ProductListViewModel: ObservableObject {
    @Published var productList: [Product] = []
    
    //INIT FOR TESTING
//    init(){
//        var arr  = [Product]()
//        let p1 = Product(id: UUID(), name: "NMFHA", frequency: "Mon Tue", dayOrNight: "Day", image: UIImage(named: "rdn-natural-moisturizing-factors-ha-30ml"))
//        let p2 = Product(id: UUID(), name: "Niacinamide", frequency: "Mon Tues Wed", dayOrNight: "Night", image: UIImage(named: "rdn-niacinamide-10pct-zinc-1pct-30ml"))
//        let p3 = Product(id: UUID(), name: "No Image Item", frequency: "Mon Tues Wed", dayOrNight: "Night")
//        arr.append(p1)
//        arr.append(p2)
//        arr.append(p3)
//        self.productList = arr
//    }
    
    func getAllProducts(){
        let products = CoreDataManager.shared.getAllProducts().map({ (pd) -> Product in
            return Product(id: pd.id ?? UUID() , name: pd.name, frequency: pd.frequency, dayOrNight: pd.dayOrNight)
        })
        self.productList = products
    }
    
    func addProduct(p: Product){
        //self.productList.append(p);
        let p2s = ProductData(context: CoreDataManager.shared.persistentContainer.viewContext)
        p2s.id = p.id
        p2s.name = p.name
        p2s.frequency = p.frequency
        p2s.dayOrNight = p.dayOrNight
        CoreDataManager.shared.save()
    }
    
    
    func updateProduct(){
        
    }
    
    func getProductDataById(p: Product) -> NSManagedObject? {
        let fetchRequest = NSFetchRequest<ProductData>(entityName: "ProductData")
        fetchRequest.predicate = NSPredicate(format: "id = %@", p.id as CVarArg)
        do {
            let foundEntities: [ProductData] = try CoreDataManager.shared.persistentContainer.viewContext.fetch(fetchRequest)
            return foundEntities[0]
        } catch {
            let fetchError = error as NSError
            debugPrint(fetchError)
        }

        return nil
    }
    
    func deleteProductp(p: Product){
        //Check if the object exists
        //CoreDataManager.shared.getProductDataByID(id: p.id)
        let nsManaged = getProductDataById(p: p)
        if(nsManaged != nil){
            CoreDataManager.shared.persistentContainer.viewContext.delete(nsManaged!)
            CoreDataManager.shared.save()
        }else{
            print("Could not delete")
        }
    }
    
    
    func deleteAll(){
        // Create Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductData")

        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try CoreDataManager.shared.persistentContainer.viewContext.execute(batchDeleteRequest)

        } catch {
            print("Error deleting everything")
        }
        CoreDataManager.shared.save()
    }
    
    
}
