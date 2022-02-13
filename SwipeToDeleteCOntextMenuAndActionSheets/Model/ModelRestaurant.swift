//
//  ModelRestaurant.swift
//  SwipeToDeleteCOntextMenuAndActionSheets
//
//  Created by Gustavo Malheiros on 12/02/22.
//

import Foundation

struct ModelRestaurant {
    
    struct Restaurant: Identifiable {
        var id = UUID()
        var name: String
        var image: String
        var isFavorite: Bool = false
        var isCheckIn: Bool = false
    }
    
}
