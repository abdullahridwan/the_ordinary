//
//  HomePageView.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/29/21.
//

import SwiftUI

struct HomePageView: View {
    @StateObject private var viewModel = HomePageViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("Background")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    HeadBar()
                    //SearchBar()
                    ItemsList(viewModel: viewModel)
                    NavBar()
                }
            }
            .edgesIgnoringSafeArea(.bottom)
//            .navigationBarTitle("", displayMode: .inline)
//            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
//            .navigationBarItems(leading:
//                                    Image(systemName: "chevron.backward").padding(.leading, 50).background(Color.black).cornerRadius(8.0))
                
            
            
            
            
            
        
        }
        
        
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
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
        //Button(action: {}) {
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
            
        //}
    }
}

struct TabBarIcon: View {
    let image: Image
    let action: () -> Void
    
    var body: some View {
        Button(action:action){
            image
                .foregroundColor(Color("TextColor"))
                .frame(maxWidth: .infinity)
                
        }
//            .foregroundColor(Color.black)
//            .padding(.all, 15)
//            .background(Color.white)
//            .cornerRadius(20.0)
//            .shadow(color: Color.black.opacity(0.15), radius: 2, x: 0.6, y: 0.6)
    }
}

struct HeadBar: View {
    var body: some View {
        HStack(){
            Text("Today's Routine")
                .font(.system(size: 35.0, weight: .heavy, design: .default))
            Spacer()
            Button(action: {}){
                Image(systemName: "person.fill")
                    .foregroundColor(Color.black)
                    .padding()
            }
        }
        .padding()
        .padding(.top, 20)
    }
}

struct NavBar: View {
    var body: some View {
        HStack{
            TabBarIcon(image: Image(systemName: "list.dash")){}
            TabBarIcon(image: Image(systemName: "house")){}
            TabBarIcon(image: Image(systemName: "person")){}
            TabBarIcon(image: Image(systemName: "gear")){}
            
        }
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
        .padding()
        .shadow(color: Color.black.opacity(0.25), radius: 3, x: 0.6, y: 0.6)
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
