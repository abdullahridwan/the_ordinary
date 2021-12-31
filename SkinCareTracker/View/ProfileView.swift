//
//  ProfileView.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/29/21.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        ZStack{
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Text("Profile View")
                Spacer()
                NavbarView(viewRouter: viewRouter)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewRouter: ViewRouter())
    }
}
