//
//  CatCardView.swift
//  TheCatsApp
//
//  Created by Kevin Hernandez on 20/06/23.
//

import SwiftUI

struct CatCardView: View {
    @StateObject private var catAPI = CatAPI()
    let catBreed: CatBreed
//    let catImage: CatImage
    
    var body: some View {
        VStack {
            Text("Raza: \(catBreed.name)")
                .font(.title3)
                .foregroundColor(Color(.systemGray3))
                .padding()
            
//            AsyncImage(url: URL(string: "\(catImage.url)")) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//            } placeholder: {
//                Image(systemName: "photo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//            }
//            .frame(width: 150, height: 150)
            
            HStack {
                Text("Pais de origen: \(catBreed.origin)")
                
                Spacer()
                
                Text("Intelligence: \(catBreed.intelligence)")
            }
        }
        .onAppear {
            catAPI.fetchCatImage(imageID: catBreed.referenceImageId)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 3)
        .padding()
    }
}

//struct CatCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CatCardView(catBreed: <#CatBreed#>)
//    }
//}
