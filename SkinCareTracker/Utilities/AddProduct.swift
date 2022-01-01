//
//  AddProduct.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/31/21.
//

import SwiftUI

struct NewProduct{
    var name: String
    var frequency: String = ""
    var dayOrNight:String = ""
    var image: UIImage = UIImage(systemName: "gear")!
}

struct AddProduct: View {
    /*
     var id : UUID
     var name: String!
     var frequency: String?
     var dayOrNight: String?
     var image: UIImage?
     */
    @State var newProduct: NewProduct = NewP
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Product Name", text: $newProduct.name)
                TextField("Frequency of Use", text: $newProduct.frequency)
            }
            .navigationBarTitle("Add a Product")
        }
    }
}

struct AddProduct_Previews: PreviewProvider {
    static var previews: some View {
        AddProduct()
    }
}
