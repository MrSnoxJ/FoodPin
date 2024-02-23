//
//  TestMyself .swift
//  FoodPin
//
//  Created by Yerasyl Sharipov on 11.03.2023.
//

import SwiftUI

struct TestMyself_: View {
    @State private var show : Bool = false
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional","Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    @State var restaurantIsFavorite =  Array(repeating: false, count: 21)
    var body: some View {
        //        List{
        //            ForEach(restaurantNames.indices, id: \.self){index in
        //
        //            }
        //        }
        VStack(alignment: .leading,spacing: 20, content: {
            Image(restaurantImages[0])
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(20)
            HStack{
                VStack(alignment: .leading, spacing: 5,content: {
                    Text(restaurantNames[0])
                        .font(.system(.title2,design: .rounded))
                    Text(restaurantLocations[0])
                        .font((.system(.body,design: .rounded)))
                    Text(restaurantTypes[0])
                        .font(.system(.subheadline,design: .rounded))
                })
            } // MARK: - Hstack
        }) // MARK: - Vstack
        .onTapGesture{
            self.show.toggle()
        }
        
    }
}

struct TestMyself__Previews: PreviewProvider {
    static var previews: some View {
        TestMyself_()
    }
}
struct MainView: View {
    var names : String
    var ImageName : String
    var Location : String
    var type : String
    @State private var show : Bool = false
    @State private var showErroe : Bool = false
    @Binding var isFavorite : Bool
    var body: some View{
        
        VStack(alignment: .leading,spacing : 20, content: {
            Image (ImageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(20)
            HStack{
                VStack(content: {
                    Text (names)
                        .font(.system(.title2,design: .rounded))
                    Text(Location)
                        .font(.system(.body,design: .rounded))
                    Text(type)
                        .font(.system(.subheadline,design: .rounded))
                }) // MARK: - VStack
            } // MARK: - Hstack
        }).onTapGesture{
            self.show.toggle()
        } .actionSheet(isPresented: $show){
            ActionSheet(title: Text("What do you whant to do?"),message: nil,buttons: [
                .destructive(Text("Reserve the table")){
                    self.showErroe.toggle()
                },
                .default(Text("Mark as a Favorite")){
                    self.showErroe.toggle()
                },.cancel()
                
            ])
        }.alert(isPresented: $showErroe){
            Alert(title: Text("Not yet avaiable"),message: Text("Sorry, this feature is not available yet. Pleaseretry later."),
                  primaryButton: .default(Text("OK")),
                  secondaryButton: .cancel()
            )
        }
    }
}
