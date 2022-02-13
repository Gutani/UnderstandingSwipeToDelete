//
//  ViewModel.swift
//  SwipeToDeleteCOntextMenuAndActionSheets
//
//  Created by Gustavo Malheiros on 12/02/22.
//

import Foundation
import Combine


class ViewModel:ObservableObject {
    
    var modelRestaurant:ModelRestaurant = ModelRestaurant()

    @Published var showActionSheet = false
    @Published var selectedRestaurant: ModelRestaurant.Restaurant?
    
    typealias Restaurant = ModelRestaurant.Restaurant
    
    @Published var restaurants = [
        Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
        Restaurant(name: "Homei", image: "homei"),
        Restaurant(name: "Teakha", image: "teakha"),
        Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
        Restaurant(name: "Petite Oyster", image: "petiteoyster"),
        Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
        Restaurant(name: "Po's Atelier", image: "posatelier"),
        Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
        Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
        Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
        Restaurant(name: "Homei", image: "upstate"),
        Restaurant(name: "Traif", image: "traif"),
        Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
        Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
        Restaurant(name: "Five Leaves", image: "fiveleaves"),
        Restaurant(name: "Cafe Lore", image: "cafelore"),
        Restaurant(name: "Confessional", image: "confessional"),
        Restaurant(name: "Barrafina", image: "barrafina"),
        Restaurant(name: "Donostia", image: "donostia"),
        Restaurant(name: "Royal Oak", image: "royaloak"),
        Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    
    func delete(item restaurant:Restaurant) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants.remove(at: index)
        }
    }
    
    func setFavorite(item restaurant:Restaurant) {
        if let index = self.restaurants.firstIndex(where: {$0.id == restaurant.id}) {
            self.restaurants[index].isFavorite.toggle()
        }
    }
    
    func setChecked(item restaurant:Restaurant) {
        if let index = self.restaurants.firstIndex(where: {$0.id == restaurant.id}) {
            self.restaurants[index].isCheckIn.toggle()
        }
    }
    
}
