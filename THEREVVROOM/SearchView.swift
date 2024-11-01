import SwiftUI

struct SearchPageView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    
    // Sample data
    @State private var lastSearches = ["Electronics", "Pants", "Three Second", "Long Shirt"]
    let popularSearches = [
        ("Lunilo Hills Jacket", "1.6k Search today", "Hot"),
        ("Denim Jeans", "1k Search today", "New"),
        ("Redli Backpack", "1.23k Search today", "Popular"),
        ("JBL Speakers", "1k Search today", "New")
    ]
    let products = [
        ("Bag Box 283", "Lisa Robber", "$163.00"),
        ("Big Biggan 283", "Gazuna Resika", "$134.00"),
        ("Bog Bag 223", "Lisa Robber", "$105.00")
    ]
    
    // Constants for layout and design
    let padding: CGFloat = 16
    let cornerRadius: CGFloat = 10
    let itemSpacing: CGFloat = 8
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                // Search Bar with Filter Icon
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search for products", text: $searchText)
                            .onTapGesture {
                                isSearching = true
                            }
                        
                        if !searchText.isEmpty {
                            Button(action: {
                                searchText = ""
                                isSearching = false
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(cornerRadius)
                    .padding(.horizontal, padding)
                    .padding(.top, padding)
                    
                    Button(action: {
                        // Action for filter icon
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.purple)
                            .padding()
                    }
                    .padding(.top, padding)
                }
                
                // Last Search Section
                if !isSearching {
                    VStack(alignment: .leading) {
                        Text("Last Search")
                            .font(.headline)
                            .padding(.horizontal, padding)
                        
                        ScrollView(.horizontal, showsIndicators: true) { // Enabled horizontal scroll bar
                            LazyHStack(spacing: itemSpacing) {
                                ForEach(lastSearches, id: \.self) { search in
                                    Text(search)
                                        .padding(.horizontal)
                                        .padding(.vertical, itemSpacing)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(cornerRadius)
                                }
                                Button("Clear All") {
                                    lastSearches.removeAll()
                                }
                                .foregroundColor(.purple)
                            }
                            .padding(.horizontal, padding)
                        }
                    }
                    .padding(.top, padding)
                }
                
                // Popular Search Section
                if !isSearching {
                    VStack(alignment: .leading) {
                        Text("Popular Search")
                            .font(.headline)
                            .padding(.horizontal, padding)
                        
                        ForEach(popularSearches, id: \.0) { search in
                            HStack {
                                Image(systemName: "photo") // Placeholder for product image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .background(Color(.systemGray5))
                                    .cornerRadius(cornerRadius)
                                
                                VStack(alignment: .leading) {
                                    Text(search.0)
                                        .fontWeight(.bold)
                                    Text(search.1)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                Text(search.2)
                                    .padding(.horizontal, itemSpacing)
                                    .padding(.vertical, itemSpacing / 2)
                                    .background(Color.red.opacity(0.2))
                                    .cornerRadius(cornerRadius)
                                    .foregroundColor(.red)
                            }
                            .padding(.horizontal, padding)
                            .padding(.vertical, itemSpacing)
                        }
                    }
                    .padding(.top, padding)
                }
                
                // Search Results Section
                ScrollView(.vertical, showsIndicators: true) { // Enabled vertical scroll bar
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: itemSpacing * 2) {
                        ForEach(products, id: \.0) { product in
                            VStack(alignment: .leading) {
                                Image(systemName: "photo") // Placeholder for product image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 150)
                                    .background(Color(.systemGray5))
                                    .cornerRadius(cornerRadius)
                                
                                Text(product.0)
                                    .font(.headline)
                                
                                Text(product.1)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                Text(product.2)
                                    .fontWeight(.bold)
                                    .padding(.top, itemSpacing)
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(cornerRadius)
                        }
                    }
                    .padding(.horizontal, padding)
                    .padding(.top, padding)
                }
            }
            .navigationTitle("Search Products")
        }
    }
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageView()
    }
}
