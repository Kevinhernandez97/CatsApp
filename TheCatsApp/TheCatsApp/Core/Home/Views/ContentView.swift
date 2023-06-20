//
//  ContentView.swift
//  TheCatsApp
//
//  Created by Kevin Hernandez on 20/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var catAPI = CatAPI()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(catAPI.catBreeds) { catBreed in
                        CatCardView(catBreed: catBreed)
                    }
                }
                .padding()
            }
            .onAppear {
                catAPI.fetchCatBreeds()
                
            }
            .navigationTitle("Raza de Gatos")
        }
    }
}

//struct ContentView: View {
//   @StateObject private var catApi = CatAPI()
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(spacing: 20) {
//                    ForEach(CatAPI.catBreeds) { catBreed in
//                        CatCardView(catBreed: catBreed)
//                    }
//                }
//            }
//            .navigationTitle("Razas de Gatos")
//        }
//        .onAppear {
//
//        }
//    }
//}
//
//struct DetalleRazaView: View {
//    let raza: CatBreeds
//
//    var body: some View {
//        VStack {
////            AsyncImage(url: raza.urlImagen) { imagen in
////                imagen
////                    .resizable()
////                    .aspectRatio(contentMode: .fit)
////            } placeholder: {
////                ProgressView()
////            }
////            .frame(maxHeight: 200)
//
//            Text(raza.name)
//                .font(.title)
//
//            Text("Origen: \(raza.origin)")
//                .font(.headline)
//
//            Text("Inteligencia: \(raza.intelligence)")
//                .font(.headline)
//        }
//        .padding()
//        .navigationTitle(raza.name)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
