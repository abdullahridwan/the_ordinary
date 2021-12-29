//
//  ProductDetailsView.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/29/21.
//

import SwiftUI

struct ProductDetailsView: View {
    @StateObject var pdViewModel = ProductDetailsViewModel(name: "Niacinamide", image: Image("rdn-niacinamide-10pct-zinc-1pct-30ml"))
    
    
    var body: some View {
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            VStack{
                pdViewModel.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
                
                ProductInfo(pdViewModel: pdViewModel)
                    .offset(y: -40.0)
                
                
            }
        }
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView()
    }
}

struct ProductInfo: View {
    @StateObject var pdViewModel: ProductDetailsViewModel
    var body: some View {
        VStack(alignment: .leading){
            Text(pdViewModel.name)
                .font(.title)
                .fontWeight(.light)
            Text(pdViewModel.get_details(name: pdViewModel.name))
            HStack{
                Spacer()
            }
        }
        .padding()
        .padding(.top)
        .background(Color.red)
        .cornerRadius(48.0)
    }
}
