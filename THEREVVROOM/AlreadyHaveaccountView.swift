import SwiftUI

struct LoginView: View {
    @State private var emailOrPhone = ""
    @State private var password = ""
    @State private var isPasswordVisible = false

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()

                Text("Login Account")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 8)

                Text("Please login with registered account")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 40)

                VStack(alignment: .leading) {
                    Text("Email or Phone Number")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.bottom, 4)

                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.white)
                        TextField("Enter your email or phone number", text: $emailOrPhone)
                            .autocapitalization(.none)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(8)

                    Text("Password")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 16)
                        .padding(.bottom, 4)

                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                        if isPasswordVisible {
                            TextField("Create your password", text: $password)
                                .autocapitalization(.none)
                                .foregroundColor(.white)
                        } else {
                            SecureField("Create your password", text: $password)
                                .foregroundColor(.white)
                        }
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(8)

                    HStack {
                        Spacer()
                        Button(action: {
                            // Action for forgot password
                        }) {
                            Text("Forgot Password?")
                                .font(.subheadline)
                                .foregroundColor(.purple)
                        }
                    }
                    .padding(.top, 8)
                }
                .padding(.horizontal, 20)

                Button(action: {
                    // Action for sign in
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

                Text("Or using other method")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.bottom, 8)

                VStack(spacing: 16) {
                    Button(action: {
                        // Action for Google sign in
                    }) {
                        HStack {
                            Image(systemName: "globe")
                            Text("Sign In with Google")
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

                    Button(action: {
                        // Action for Facebook sign in
                    }) {
                        HStack {
                            Image(systemName: "f.circle.fill")
                            Text("Sign In with Facebook")
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
                .padding(.horizontal, 20)

                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
