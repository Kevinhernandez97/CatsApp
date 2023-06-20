//
//  CatAPI.swift
//  TheCatsApp
//
//  Created by Kevin Hernandez on 20/06/23.
//

import Foundation

class CatAPI: ObservableObject {
    @Published var catBreeds: [CatBreed] = []
    @Published var catImages: [CatImage] = []
        
        func fetchCatBreeds() {
            guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else {
                return
            }

            var request = URLRequest(url: url)
            request.setValue("bda53789-d59e-46ed-9bc4-2936630fde39", forHTTPHeaderField: "x-api-key")

            URLSession.shared.dataTask(with: request) { [self] data, response, error in
                if let data = data {
                    if let breeds = self.parseData(data) {
                        DispatchQueue.main.async { [self] in
                            self.catBreeds = breeds
                        }
                    }
                }
            }.resume()
        }

        func parseData(_ data: Data) -> [CatBreed]? {
            let decoder = JSONDecoder()
            do {
                let breeds = try decoder.decode([CatBreed].self, from: data)
                return breeds
            } catch {
                print("Error al analizar los datos: \(error)")
                return nil
            }
        }
    
    func fetchCatImage(imageID: String) {
        let urlApi = "https://api.thecatapi.com/v1/images/\(imageID)"
        guard let url = URL(string: urlApi) else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            guard let data = data else { return }
            
            do {
                let catImage = try JSONDecoder().decode([CatImage].self, from: data)
                
                DispatchQueue.main.async {
                    self.catImages = catImage
                }
            } catch {
                print("DEBUG: Error decoding image: \(error.localizedDescription)")
            }
        }
    }
}
