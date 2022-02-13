//
//  ContentView.swift
//  SwipeToDeleteCOntextMenuAndActionSheets
//
//  Created by Gustavo Malheiros on 12/02/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        List {
            ListButtons(viewModel: ViewModel())
        }.listStyle(.plain)
        
    }
}

struct BasicRestaurantRow :View {
    var modelRestaurant:ModelRestaurant.Restaurant
    
    var body: some View {
        HStack {
            Image(modelRestaurant.image).resizable().frame(width: 40, height: 40).cornerRadius(5)
            Text(modelRestaurant.name)
            Spacer()
            if modelRestaurant.isFavorite {
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }
            
            if modelRestaurant.isCheckIn {
                Image(systemName: "checkmark.seal.fill").foregroundColor(.red)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListButtons: View {
    
    @ObservedObject var viewModel:ViewModel
    
    var body: some View {
        ForEach(viewModel.restaurants) { rest in
            BasicRestaurantRow(modelRestaurant: rest).contextMenu {
                Button {
                    viewModel.delete(item: rest)
                } label: {
                    HStack {
                        Text("Delete")
                        Image(systemName: "trash")
                    }
                }
                
                Button {
                    viewModel.setFavorite(item: rest)
                } label: {
                    HStack {
                        Text("Favorite")
                        Image(systemName: "star")
                    }
                }
                
                Button{
                    viewModel.setChecked(item: rest)
                } label: {
                    HStack {
                        Text("Check-in")
                        Image(systemName: "checkmark.seal.fill")
                    }
                }
                
                
            }.onTapGesture {
                viewModel.showActionSheet.toggle()
                viewModel.selectedRestaurant = rest
            }.actionSheet(isPresented: $viewModel.showActionSheet) {
                ActionSheet(title: Text("Choose what you want to do"), message: nil, buttons: [
                    .default(Text("Mark as Favorite"), action: {
                        if let selectedRestaurant = viewModel.selectedRestaurant {
                            viewModel.setFavorite(item: selectedRestaurant)
                        }
                    }),
                    .default(Text("Check-in"), action: {
                        if let selectedRestaurant = viewModel.selectedRestaurant {
                            viewModel.setChecked(item: selectedRestaurant)
                        }
                    }),
                    .destructive(Text("Delete"), action: {
                        if let selectedRestaurant = viewModel.selectedRestaurant {
                            viewModel.delete(item: selectedRestaurant)
                        }
                    }),
                    .cancel()
                ])
            }
        }.onDelete {
            (indexSet) in
            //Here, we are passing the index of a row to be deleted
            self.viewModel.restaurants.remove(atOffsets: indexSet)
        }
    }
}
