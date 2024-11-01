import SwiftUI

struct CombinedOnboardingScreen: View {
    @State private var currentPage = 0
    
    let titles = [
        "Get Good Pot ",
        "Anytime Anywhere",
        "Get Quick And Hassle Free Delivery"
    ]
    
    let subtitles = [
        "From a wide range of International and Domestic Brands",
        "An AI Based Garage To Help You Make Better Choices",
        "Express Delivery Available At No Extra Charge"
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                TabView(selection: $currentPage) {
                    ForEach(0..<3, id: \.self) { index in
                        OnboardingView(
                            image: "pitstop",
                            title: titles[index],
                            subtitle: subtitles[index],
                            currentPage: $currentPage,
                            totalDots: 3
                        )
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.width < -50, currentPage < 2 {
                                currentPage += 1
                            } else if value.translation.width > 50, currentPage > 0 {
                                currentPage -= 1
                            }
                        }
                )
            }
        }
    }
}

struct OnboardingView: View {
    var image: String
    var title: String
    var subtitle: String
    @Binding var currentPage: Int
    var totalDots: Int
    
    var body: some View {
        VStack {
            Image("Image 1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .padding(.top, 40)
                .padding(.horizontal, 20)
            
    
            
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .foregroundColor(.white)
            
            Text(subtitle)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.top, 8)
                .foregroundColor(.white)
            
            HStack(spacing: 8) {
                ForEach(0..<totalDots, id: \.self) { index in
                    Circle()
                        .fill(currentPage == index ? Color.purple : Color.white)
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.top, 20)
            
            Spacer().frame(height: 30)
            
            NavigationLink(destination: CreateAccountView()) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(25)
                    .padding(.horizontal, 20)
            }
            .padding(.bottom, 8)
            
            NavigationLink(destination: LoginView()) {
                Text("Already Have an Account,Skip!")
                    .font(.headline)
                    .foregroundColor(.purple)
            }
            .padding(.bottom, 20)
        }
    }
}

struct CombinedOnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        CombinedOnboardingScreen()
    }
}
