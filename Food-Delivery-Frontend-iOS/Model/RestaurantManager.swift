//
//  RestaurantManager.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 21.08.2021.
//

import Foundation

protocol RestaurantManagerDelegate {
    func didUpdateRestaurant(_ restaurantManager: RestaurantManager, restaurantDetails: [RestaurantDetail])
    func didFailWithError(error: Error)
}

struct RestaurantManager {
    let mainURL = "https://api.jsonbin.io/b/"
    let dataId = "6121074f076a223676af0c92"
    let versionNumber = "4"
    
    var delegate: RestaurantManagerDelegate?
    
    func fetchData() {
        let urlString = "\(mainURL)\(dataId)/\(versionNumber)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let restaurantDetails = self.parseJSON(safeData) {
                        self.delegate?.didUpdateRestaurant(self, restaurantDetails: restaurantDetails)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ restaurantData: Data) -> [RestaurantDetail]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Restaurant.self, from: restaurantData)
            var restaurantDetails: [RestaurantDetail] = []
            for restaurant in decodedData.restaurants {
                let name = restaurant.name
                let image = restaurant.image
                let location = restaurant.location
                let foods = restaurant.foods
                
                let restaurantDetail = RestaurantDetail(name: name, image: image, location: location, foods: foods)
                
                restaurantDetails.append(restaurantDetail)
            }
            return restaurantDetails
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
