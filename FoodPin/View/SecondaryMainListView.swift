//
//  SecondaryMainListMain.swift
//  FoodPin
//
//  Created by Yerasyl Sharipov on 11.03.2023.
//

import SwiftUI

struct SecondaryMainListView: View {
    @State private var show : Bool = false
    @State var restaurants = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location:
    "Hong Kong", image: "cafedeadend", isFavorite: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image:
    "homei", isFavorite: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isFavorite: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isFavorite: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong"
    , image: "petiteoyster", isFavorite: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "HongKong", image: "forkee", isFavorite: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong"
    , image: "posatelier", isFavorite: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location:
    "Sydney", image: "bourkestreetbakery", isFavorite: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney"
    , image: "haigh", isFavorite: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palomino", isFavorite: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isFavorite: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isFavorite: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "graham", isFavorite: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "waffleandwolf", isFavorite: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isFavorite: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isFavorite: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York"
    , image: "confessional", isFavorite: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isFavorite: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isFavorite: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isFavorite: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "cask", isFavorite: false)
    ]

    var body: some View {
        List{
            ForEach(restaurants.indices, id: \.self){index in
                ExtractedView2(restaurant: $restaurants[index])
                    .swipeActions(edge: .leading,allowsFullSwipe: false, content: {
                        Button(action: {
                            
                        }, label: {
                        Image(systemName: "heart")
                                
                            
                        }).tint(.green)
                        Button(action: {
                            
                        }, label: {
                            Image (systemName: "square.and.arrow.up")
                        }).tint(.orange)
                    })
            } // MARK: - ForEach
            .onDelete(perform: {
                indexSet in
                restaurants.remove(atOffsets: indexSet)
            })
            .listRowSeparator(.hidden)
        } // MARK: - List
        .listStyle(.plain)
        
    }
}

struct SecondaryMainListMain_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryMainListView()
    }
}
struct ExtractedView2: View {
    @State private var show : Bool = false
    @State private var showError : Bool = false
    @Binding var restaurant : Restaurant
    
    var body: some View {
        HStack(alignment: .top,spacing: 20) {
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(width: 118,height: 120)
                .cornerRadius(20)
            
                VStack (alignment: .leading){
                    
                    Text(restaurant.name)
                        .font(.system(.title2,design: .rounded))
                    Text(restaurant.location)
                        .font(.system(.body,design: .rounded))
                    Text(restaurant.type)
                        .font(.system(.subheadline,design: .rounded))
                        .foregroundColor(.gray)
                }
                if restaurant.isFavorite {
                        Spacer()
                        Image (systemName: "heart.fill")
                            .foregroundColor(.yellow)
                    
                }
                
            
        } // MARK: - Vstack
        .onTapGesture{
            show.toggle()
        }
        .actionSheet(isPresented: $show){
            ActionSheet(title: Text("What do you want to do?"),message: nil,buttons: [
                .default(Text("Reserve the table")){
                    self.showError.toggle()
                },
                .default(Text(restaurant.isFavorite ? "Removefrom favorites" : "Mark as favorite")) {
                    self.restaurant.isFavorite.toggle()
                    
                    
                },
                .cancel()
            ]) // MARK: - ActionSheet
        } // MARK: - ActionSheet
        .alert(isPresented: $showError){
            Alert(title: Text("Not yet avaiable"),message: Text("Sorry, this feature is not available yet. Pleaseretry later."),
                  primaryButton: .default(Text("OK")),
                  secondaryButton: .cancel()
            )
        }
    }
}
