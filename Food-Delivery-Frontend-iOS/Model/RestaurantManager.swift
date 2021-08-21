//
//  RestaurantManager.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 21.08.2021.
//

import Foundation

struct RestaurantManager {
    let mainURL = "https://api.jsonbin.io/b/"
    let dataId = "6121074f076a223676af0c92"
    
    func fetchData() {
        let urlString = "\(mainURL)\(dataId)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {
                (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(restaurantData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(restaurantData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Restaurant.self, from: restaurantData)
            print(decodedData.restaurants[0].name)
        } catch {
            print(error)
        }
    }
}
