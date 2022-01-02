//
//  AddProduct.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/31/21.
//

import SwiftUI
import UIKit

struct AddProduct: View {
    /*
     var id : UUID
     var name: String!
     var frequency: String?
     var dayOrNight: String?
     var image: UIImage?
     */
    @State var np : Product
    @State private var dn: String = "Day"
    var times = ["Day", "Night"]
    
    //= Product(id: UUID(), name: "", frequency: "", dayOrNight: "", image: UIImage(systemName: "gear"))

    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Product Name", text: $np.name)
                    TextField("Frequency of Use", text: $np.frequency ?? "")
                    Picker(selection: $np.dayOrNight, label: Text("Using Day or Night?")) {
                        ForEach(0 ..< times.count) {
                            Text(self.times[$0])
                        }
                    }
                }
                Section{
                    Text("Choose a photo")
                    ImagePickerView(image: np.image ?? UIImage())
                        .padding(.leading, -10)
                        //.border(Color.red, width: 4)

                }
                
             
            }
            .navigationBarTitle("Add a Product")
            
            
        }
    }
    
}

struct AddProduct_Previews: PreviewProvider {
    static var previews: some View {
        AddProduct(np: Product(id: UUID(), name: "Some Name", frequency: "", dayOrNight: "Day"))
    }
}
