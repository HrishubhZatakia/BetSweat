// Home screen view
import SwiftUI

struct HomeView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false

    var body: some View {
        VStack {
            Text("Welcome to Fitness Buddy!")
                .font(.title)

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
    }

    func logout() {
        isLoggedIn = false
    }
}

