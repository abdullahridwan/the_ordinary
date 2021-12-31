//
//  HomePageView.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/29/21.
//

import SwiftUI

struct HomePageView: View {
    @StateObject private var viewModel = HomePageViewModel()
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        NavigationView {
            ZStack{
                Color("Background")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    HeadBar(title: "Today's Routine")
                    //SearchBar()
                    //add the day capsule thing.
                    ItemsList(viewModel: viewModel)
                    Spacer()
                    NavbarView(viewRouter: viewRouter)
                }
            }
            .edgesIgnoringSafeArea([.top, .bottom])
        }
        
        
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(viewRouter: ViewRouter())
    }
}


struct SearchBar: View {
    @State private var search: String = ""
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass.circle.fill")
                .padding(.trailing, 8)
                .foregroundColor(Color("TextColor"))
            TextField("Search....", text: $search)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10.0)
        .padding(.horizontal)
        .padding(.top, 30)
        .padding(.bottom, 40)
    }
}

struct Card: View {
    
    let image: Image
    let name: String
    let day: Bool
    
    var body: some View {
            HStack{
                image
                    .resizable()
                    .frame(width: 52.0, height: 52.0)
                    .padding()
                    .foregroundColor(Color.black)
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(Color.black)
                    Text(day ? "Day" : "Night")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(day ? Color.orange : Color.blue)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .padding()
                    .foregroundColor(Color.black)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20.0)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .shadow(color: Color.black.opacity(0.15), radius: 2, x: 0.6, y: 0.6)
    }
}




struct ItemsList: View {
    @StateObject var viewModel: HomePageViewModel
    var body: some View {
        ScrollView{
            ForEach(viewModel.items, id: \.self){ item in
                NavigationLink(destination: ProductDetailsView(),
                               label: {
                    Card(image: Image(item), name: viewModel.cleanName(rawName: item), day: true)
                })
                    .navigationBarHidden(true)
                    .foregroundColor(Color.black)
            }
        }
    }
}
