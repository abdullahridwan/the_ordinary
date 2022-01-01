//
//  NavbarView.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/29/21.
//

import SwiftUI

struct NavbarView: View {
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        HStack{
            TabBarIcon(viewRouter: viewRouter, assignedPage: .list, image: Image(systemName: "list.dash")){
                viewRouter.currentPage = .list
            }
            TabBarIcon(viewRouter: viewRouter, assignedPage: .home, image: Image(systemName: "house")){
                viewRouter.currentPage = .home
            }
                TabBarIcon(viewRouter: viewRouter, assignedPage: .profile,image: Image(systemName: "person")){
                    viewRouter.currentPage = .profile
                }
        }
        .padding(.all, 3)
        .background(Color.white)
        .clipShape(Capsule())
        .padding()
        .padding(.bottom, 10)
        .shadow(color: Color.black.opacity(0.25), radius: 3, x: 0.6, y: 0.6)
    }
}


struct NavbarView_Previews: PreviewProvider {
    static var previews: some View {
        NavbarView(viewRouter: ViewRouter())
    }
}

struct TabBarIcon: View {
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let image: Image
    let action: () -> Void
    
    var body: some View {
        
        Button(action:{
            viewRouter.currentPage = assignedPage
            print("Current page is \(viewRouter.currentPage) and the assigned page is \(assignedPage)")
        }){
            
            
            if(viewRouter.currentPage == assignedPage){
                image
                    .foregroundColor(Color.white)
                    .frame(width: 45.0, height: 45.0)
                    .animation(.easeIn(duration: 300.0))
                    .background(Color("TextColor"))
                    .cornerRadius(40.0)
                    .frame(maxWidth: .infinity)
                    .shadow(color: Color.black.opacity(0.2), radius: 2.0)
            }else{
                image
                    .foregroundColor(Color("TextColor"))
                    .frame(maxWidth: .infinity)
            }
                
                
                
        }
    }
}
