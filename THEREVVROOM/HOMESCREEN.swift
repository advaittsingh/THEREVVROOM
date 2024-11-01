import SwiftUI

struct HOMESCREEN: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            CartView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }
            
            ChatView()
                .tabItem {
                    Image(systemName: "bubble.left.fill")
                    Text("Chat")
                }
        }
    }
}

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SearchBar()
                
                // Featured Cars Section
                Text("Featured Cars")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(0..<3) { _ in
                            CarCard()
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Our Products Section
                Text("Our Products")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(0..<3) { _ in
                            ProductCard()
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct SearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            TextField("Search for cars, parts, shops...", text: $searchText)
                .padding(.leading, 10)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            
            Button(action: {
                // Perform search
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

struct CarCard: View {
    var body: some View {
        VStack {
            Image("car_image") // Replace with your car image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 100)
                .cornerRadius(10)
            
            Text("Tesla Model S")
                .font(.headline)
                .padding(.top, 5)
            
            Text("$75,000 - 2020")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ProductCard: View {
    var body: some View {
        VStack {
            Image("product_image") // Replace with your product image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 100)
                .cornerRadius(10)
            
            Text("Car Cover")
                .font(.headline)
                .padding(.top, 5)
            
            Text("$29.99")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search View")
    }
}

struct CartView: View {
    var body: some View {
        Text("Cart View")
    }
}

struct MESSAGEView: View {
    var body: some View {
        Text("Chat View")
    }
}

struct HOMESCREEN_Previews: PreviewProvider {
    static var previews: some View {
        HOMESCREEN()
    }
}
