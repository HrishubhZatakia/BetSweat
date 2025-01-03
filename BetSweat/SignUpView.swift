import SwiftUI

struct SignupView: View {
    @Binding var showSignup: Bool
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
                .font(.largeTitle)
                .bold()

            TextField("User Name", text: $username)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Email", text: $email)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: signup) {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Button(action: { showSignup = false }) {
                Text("Back to Login")
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }

    func signup() {
        UserDefaults.standard.set(password, forKey: email)
        UserDefaults.standard.set(password, forKey: "username_" + username)
        UserDefaults.standard.set(email, forKey: "email_" + username)
        print("Account created for email: \(email) and username: \(username)")
        showSignup = false
    }
}
