import SwiftUI

struct CreateAccountView: View {
    @State private var username: String = ""
    @State private var emailOrPhoneNumber: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var navigateToHomepage = false

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                Text("Create Account")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                    .foregroundColor(.white)
                
                Text("Start learning by creating your account")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                
                VStack(spacing: 16) {
                    CustomTextField(placeholder: "Create your username", iconName: "person", text: $username)
                    CustomTextField(placeholder: "Enter your email or phone number", iconName: "envelope", text: $emailOrPhoneNumber)
                    
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                        if isPasswordVisible {
                            TextField("Create your password", text: $password)
                        } else {
                            SecureField("Create your password", text: $password)
                        }
                        
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                }
                .padding(.horizontal, 20)
                
                NavigationLink(destination: HomepageView().navigationBarBackButtonHidden(true), isActive: $navigateToHomepage) {
                    EmptyView()
                }
                
                Button(action: {
                    navigateToHomepage = true
                }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(25)
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 20)

                Text("Or using other methods")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.bottom, 8)

                VStack(spacing: 16) {
                    SocialSignInButton(iconName: "globe", text: "Sign In with Google", action: {
                        navigateToHomepage = true
                    })
                    SocialSignInButton(iconName: "f.circle.fill", text: "Sign In with Facebook", action: {
                        navigateToHomepage = true
                    })
                }
                .padding(.horizontal, 20)
                Spacer()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}

struct CustomTextField: View {
    var placeholder: String
    var iconName: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.gray)
            TextField(placeholder, text: $text)
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
    }
}

struct SocialSignInButton: View {
    var iconName: String
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: iconName)
                Text(text)
                    .font(.headline)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}

