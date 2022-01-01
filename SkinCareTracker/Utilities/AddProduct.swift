//
//  AddProduct.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/31/21.
//

import SwiftUI

struct AddProduct: View {
    /*
     var id : UUID
     var name: String!
     var frequency: String?
     var dayOrNight: String?
     var image: UIImage?
     */
    @State var name: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Product Name", text: $name)
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct AddProduct_Previews: PreviewProvider {
    static var previews: some View {
        AddProduct()
    }
}
