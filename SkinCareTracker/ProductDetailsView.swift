//
//  ProductDetailsView.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/29/21.
//

import SwiftUI

struct ProductDetailsView: View {
    @StateObject var pdViewModel = ProductDetailsViewModel(name: "Niacinamide", image: Image("TestImage"))
    
    
    var body: some View {
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack{
                    pdViewModel.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.top)
                    
                    ProductInfo(pdViewModel: pdViewModel)
                        .offset(y: -100.0)
                }
            }
            .edgesIgnoringSafeArea(.all)
//            .navigationBarBackButtonHidden(true)
//            .navigationBarItems(leading:
//                                    Image(systemName: "chevron.backward")
//                                    .frame(width: 7.0, height: 7.0)
//                                        .padding(.all, 12)
//                                        .background(Color.white)
//                                        .cornerRadius(8.0)
//            )
            
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
                .fontWeight(.semibold)
                .padding()
                //.shadow(radius: 0.4)
            Text(pdViewModel.get_details(name: pdViewModel.name))
                .padding()
            HStack{Spacer()}
            Spacer()
        }
        .padding()
        .padding(.top)
        .background(Color("Background"))
        .cornerRadius(40.0)
    }
}
