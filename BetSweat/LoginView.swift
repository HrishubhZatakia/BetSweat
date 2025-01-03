import SwiftUI

struct LoginView: View {
    @State private var input: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    @State private var showSignup: Bool = false
    @Binding var isLoggedIn: Bool

    var body: some View {
        VStack(spacing: 20) {
            Text("Bet Sweat")
                .font(.largeTitle)
                .bold()

            TextField("Email or Username", text: $input)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }

            Button(action: login) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Button(action: { showSignup.toggle() }) {
                Text("Don’t have an account? Sign Up")
            }
            .sheet(isPresented: $showSignup) {
                SignupView(showSignup: $showSignup)
            }
        }
        .padding()
    }

    func login() {
        let storedPassword = UserDefaults.standard.string(forKey: input)
        let usernameKey = "username_" + input
        let emailKey = "email_" + input

        if storedPassword == password ||
            UserDefaults.standard.string(forKey: emailKey) == password ||
            UserDefaults.standard.string(forKey: usernameKey) == password {
            isLoggedIn = true
            errorMessage = ""
        } else if UserDefaults.standard.string(forKey: emailKey) == nil &&
                  UserDefaults.standard.string(forKey: usernameKey) == nil {
            errorMessage = "No account exists with the provided email/username."
        } else {
            errorMessage = "Incorrect password."
        }
    }
}

