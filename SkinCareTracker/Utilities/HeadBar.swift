//
//  HeadBar.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/29/21.
//

import SwiftUI

struct HeadBar: View {
    let title: String
    var body: some View {
        HStack(){
            Text(title)
                .font(.system(size: 35.0, weight: .heavy, design: .default))
                .foregroundColor(Color("TextColor"))
            Spacer()
        }
        .padding()
        .padding(.top, 60)
        .padding(.bottom, 30)
        
    }
}

struct HeadBar_Previews: PreviewProvider {
    static var previews: some View {
        HeadBar(title: "Title")
    }
}



//            .navigationBarTitle("", displayMode: .inline)
//            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
//            .navigationBarItems(leading:
//                                    Image(systemName: "chevron.backward").padding(.leading, 50).background(Color.black).cornerRadius(8.0))
