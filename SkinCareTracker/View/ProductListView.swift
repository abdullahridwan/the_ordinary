//
//  ProductListView.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/29/21.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var viewRouter: ViewRouter
    @StateObject var productListModel: ProductListViewModel
    var body: some View {
            ZStack{
                Color("Background")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading){
                    //HeadBar(title: "All Items")
                    AllProducts(productListViewModel: productListModel)
                    Spacer()
                    NavbarView(viewRouter: viewRouter)
                }
            }
            .edgesIgnoringSafeArea([.top, .bottom])
        
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(viewRouter: ViewRouter(), productListModel: ProductListViewModel())
    }
}

struct ListCard: View {
    let title: String
    let freq: String
    let dayOrNight: String

    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(freq)
                    .font(.subheadline)
                Text(dayOrNight == "Day" ? "Day" : "Night")
                    .font(.subheadline)
                    .foregroundColor(dayOrNight == "Day" ? Color("Day") : Color("Night"))
            }
            Spacer()
            
            Image(systemName: dayOrNight == "Day" ? "sun.max" : "moon.stars.fill")
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundColor(dayOrNight == "Day" ? Color("Day") : Color("Night"))
                .padding(.trailing)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        .padding()
        .padding(.vertical, -10)
        .shadow(color: Color.black.opacity(0.15), radius: 2, x: 0.6, y: 0.6)
    }
}


struct ListCardSimple: View {
    let image: Image
    let title: String
    let freq: String
    let dayOrNight: String
    
    var body: some View{
        HStack {
            image
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.thin)
                Text(freq)
                    .font(.subheadline)
                Text(dayOrNight == "Day" ? "Day" : "Night")
                    .font(.subheadline)
                    .foregroundColor(dayOrNight == "Day" ? Color("Day") : Color("Night"))
            }
            
            Spacer()
        }
        
    }
}

struct AllProducts: View {
    @State private var editMode = EditMode.inactive
    @State private var showingSheet = false
    @StateObject var productListViewModel: ProductListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(productListViewModel.productList, id: \.self){product in
                    ListCardSimple(image: Image(uiImage: product.image ?? UIImage.checkmark), title: product.name,
                        freq: "Mon Tues Wed", dayOrNight: "Day")
                }
                .onDelete(perform: onDelete)
                .onMove(perform: onMove)
                
                
                
                
            }
            .onAppear {
                //productListViewModel.deleteAll()
                UITableView.appearance().backgroundColor =  UIColor(named: "Background")
                productListViewModel.getAllProducts()
            }
            .navigationBarTitle("All Items")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .environment(\.editMode, $editMode)
            .sheet(isPresented: $showingSheet) {
                        SheetView()
                    }
            
        }
    }
    
    
    
    private var addButton: some View {
        switch editMode {
        case .inactive:
            return AnyView(Button(action: {
                onAdd()
                productListViewModel.getAllProducts()
            }) { Image(systemName: "plus") })
        default:
            return AnyView(EmptyView())
        }
    }
    
    
    private func onAdd() {
        //showingSheet.toggle()
        //save an item. just test it out by saving a random item for now
        productListViewModel.addProduct(p: Product(id: UUID(), name: "Product that was saved", frequency: "Fri", dayOrNight: "Night"))
    }
    private func onDelete(offsets: IndexSet) {
        productListViewModel.productList.remove(atOffsets: offsets)
        //delete for realsies
        offsets.forEach { index in
            let sp = productListViewModel.productList[index]
            productListViewModel.deleteProductp(p: sp)
        }
    }
    private func onMove(source: IndexSet, destination: Int) {
        productListViewModel.productList.move(fromOffsets: source, toOffset: destination)
    }
    
    
}

