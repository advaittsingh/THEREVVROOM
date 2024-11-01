import SwiftUI

struct HomepageView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HeaderView()
                ScrollView {
                    VStack(spacing: 30) { // Updated spacing between sections
                        PromoBannerView()
                        NewArrivalsView()
                        TrendingView()
                        OnSaleView()
                    }
                    .padding(.vertical)
                }
                BottomTabBarView()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hi, Rohan")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                Text("Let's go shopping")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            HStack(spacing: 20) {
                HeaderButton(iconName: "magnifyingglass") {
                    // Search action
                }
                HeaderButton(iconName: "bell") {
                    // Notifications action
                }
            }
        }
        .padding(.horizontal)
    }
}

struct HeaderButton: View {
    let iconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: iconName)
                .font(.title)
                .foregroundColor(.red)
        }
    }
}

struct PromoBannerView: View {
    var body: some View {
        VStack {
            Image("Image 1")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
            Text("29% off shipping today on purchases")
                .font(.headline)
                .padding(.top, 10)
                .foregroundColor(.cyan)
            Text("By Pitstop")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
}

struct ProductListView: View {
    let title: String
    let products: [(String, String, String, String)]
    let titleColor: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(titleColor)
                Spacer()
                Button(action: {
                    // See all action
                }) {
                    Text("See All")
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(products, id: \.0) { product in
                        ProductCardView(name: product.0, designer: product.1, price: product.2, imageName: product.3)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct NewArrivalsView: View {
    let products = [
        ("POT", "one Pack", "1000.00", "product1"),
        ("POT", "2+1 pack", "2000.00", "product2")
    ]
    
    var body: some View {
        ProductListView(title: "New Arrivals", products: products, titleColor: .yellow)
    }
}

struct TrendingView: View {
    let products = [
        ("POT", "one Pack", "1000.00", "product1"),
        ("POT", "2+1 pack", "2000.00", "product2")
    ]
    
    var body: some View {
        ProductListView(title: "Trending Products", products: products, titleColor: .yellow)
    }
}

struct OnSaleView: View {
    let products = [
        ("POT", "one Pack", "1000.00", "product1"),
        ("POT", "2+1 pack", "2000.00", "product2")
    ]
    
    var body: some View {
        ProductListView(title: "Flat 50% off", products: products, titleColor: .yellow)
    }
}

struct ProductCardView: View {
    let name: String
    let designer: String
    let price: String
    let imageName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("Image 1")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(10)
            Text(name)
                .font(.headline)
                .padding(.top, 5)
                .foregroundColor(.cyan)
            Text(designer)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(price)
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top, 2)
                .foregroundColor(.cyan)
        }
        .frame(width: 150)
    }
}

struct BottomTabBarView: View {
    var body: some View {
        HStack {
            Spacer()
            TabBarButton(iconName: "house.fill", label: "Home")
            Spacer()
            TabBarButton(iconName: "cart.fill", label: "My Order")
            Spacer()
            TabBarButton(iconName: "heart.fill", label: "Favorite")
            Spacer()
            TabBarButton(iconName: "person.fill", label: "My Profile")
            Spacer()
        }
        .padding()
        .background(Color.black)
        .shadow(radius: 10)
    }
}

struct TabBarButton: View {
    let iconName: String
    let label: String
    
    var body: some View {
        Button(action: {
            // Tab action
        }) {
            VStack {
                Image(systemName: iconName)
                    .font(.title)
                    .foregroundColor(.red)
                Text(label)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
