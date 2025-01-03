// Home screen view
import SwiftUI

struct HomeView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @State private var generatedCode: String = ""
    @State private var friendCode: String = ""
    @State private var showStreakPage: Bool = false
    @State private var errorMessage: String? = nil

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Welcome to Bet Sweat!")
                    .font(.title)
                    .padding()

                // Share your code button
                Button(action: shareCode) {
                    Text("Share Your Code with a Friend")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                // Friend's code input
                VStack(alignment: .leading, spacing: 10) {
                    Text("Enter Friend's Code:")
                        .font(.subheadline)
                    TextField("Friend's Code", text: $friendCode)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)

                    if let error = errorMessage {
                        Text(error)
                            .font(.caption)
                            .foregroundColor(.red)
                    }

                    Button(action: validateCode) {
                        Text("Submit Code")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()

                Spacer()

                // Logout button
                Button(action: logout) {
                    Text("Logout")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            .navigationDestination(isPresented: $showStreakPage) {
                StreakPage()
            }
        }
    }

    func shareCode() {
        generatedCode = UUID().uuidString.prefix(6).uppercased()
        let shareMessage = "Join me on Bet Sweat! Use this code: \(generatedCode)"
        let activityVC = UIActivityViewController(activityItems: [shareMessage], applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(activityVC, animated: true, completion: nil)
        }
    }

    func validateCode() {
        if friendCode == generatedCode {
            showStreakPage = true
        } else {
            errorMessage = "Invalid code. Please try again."
        }
    }

    func logout() {
        isLoggedIn = false
    }
}

struct StreakPage: View {
    var body: some View {
        Text("Streak Page")
            .font(.title)
            .padding()
    }
}
