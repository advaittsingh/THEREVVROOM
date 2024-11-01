import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("MY POT")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Your one stup pot hub")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                Spacer()
                NavigationLink(destination: CombinedOnboardingScreen().navigationBarBackButtonHidden(true)) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(25)
                        .padding(.horizontal, 20)
                }
                .padding(.bottom, 8)
                
                Text("Version 0.0.1")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.bottom, 32)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        }
    }
}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

