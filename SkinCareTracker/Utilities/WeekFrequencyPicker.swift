//
//  WeekFrequencyPicker.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 12/31/21.
//

import SwiftUI

struct WeekFrequencyPicker: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Weekday Frequency")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom)
            Text("Choose which days you would want to use this product!")
            
            HStack{
                WeekButton(name: "S")
                WeekButton(name: "M")
                WeekButton(name: "T")
                WeekButton(name: "W")
                WeekButton(name: "T")
                WeekButton(name: "F")
                WeekButton(name: "S")
            }
        }
        
        
        
    }
}

struct WeekFrequencyPicker_Previews: PreviewProvider {
    static var previews: some View {
        WeekFrequencyPicker()
    }
}

struct WeekButton: View {
    var name: String
    var body: some View {
        
        Button(action: {
            Text(name)
                .foregroundColor(Color.green)
                .padding()
                .frame(width: 50.0, height: 50.0)
                .background(Color.black.opacity(0.2))
                .cornerRadius(50.0)
        }, label: {
            Text(name)
                .foregroundColor(Color.white)
                .padding()
                .frame(width: 50.0, height: 50.0)
                .background(Color.black.opacity(0.2))
                .cornerRadius(50.0)
        })
    }
}
