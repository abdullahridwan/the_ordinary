//
//  CoreDataManager.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/31/21.
//

import Foundation
import CoreData

class CoreDataManager {
    var persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    func getProductDataByID(id: NSManagedObjectID) -> ProductData? {
        do{
            return try CoreDataManager.shared.persistentContainer.viewContext.existingObject(with: id) as? ProductData
        }catch{
            print("[CoreDataManager] [getProductDataByID]")
            return nil
        }
    }
    
    
    func getAllProducts() -> [ProductData]{
        let request: NSFetchRequest<ProductData> = ProductData.fetchRequest()
        do{
            return try persistentContainer.viewContext.fetch(request)
        }catch {
            return []
        }
    }
    
    func save(){
        do{
            try persistentContainer.viewContext.save()
        }catch {
            persistentContainer.viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    private init(){
        self.persistentContainer = NSPersistentContainer(name: "ProductModel")
        persistentContainer.loadPersistentStores { (description, err) in
            if let err = err {
                fatalError("Error")
            }
        }
    }
    
    
    
}
