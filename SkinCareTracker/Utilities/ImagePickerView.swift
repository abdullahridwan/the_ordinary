//
//  ImagePickerView.swift
//  SkinCareTracker
//
//  Created by Abdullah Ridwan on 1/2/22.
//

import SwiftUI

struct ImagePickerView: View {
    @State var image: UIImage
    @State private var showSheet = false
    var body: some View {
            VStack {
                Image(uiImage: self.image)
                      .resizable()
                      //.cornerRadius(50)
                      .frame(width: 300, height: 200)
                      .background(Color.black.opacity(0.2))
                      .aspectRatio(contentMode: .fit)
                      //.clipShape(Circle())

                Text("Change photo")
                     .font(.headline)
                     .frame(maxWidth: .infinity)
                     .frame(height: 50)
                     .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.262745098, green: 0.0862745098, blue: 0.8588235294, alpha: 1)), Color(#colorLiteral(red: 0.5647058824, green: 0.462745098, blue: 0.9058823529, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                     .cornerRadius(16)
                     .foregroundColor(.white)
                         .padding(.horizontal)
                         .onTapGesture {
                           showSheet = true
                         }
            }
        .padding()
        .sheet(isPresented: $showSheet) {
                    // Pick an image from the photo library:
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)

                    //  If you wish to take a photo from camera instead:
                    // ImagePicker(sourceType: .camera, selectedImage: self.$image)
            }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(image: UIImage())
    }
}
