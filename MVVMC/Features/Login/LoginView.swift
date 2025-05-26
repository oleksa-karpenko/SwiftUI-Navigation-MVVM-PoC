import SwiftUI

struct LoginView: View {
  @ObservedObject var viewModel: LoginViewModel

  var body: some View {
    VStack {
      VStack(spacing: 8) {
        Image(systemName: "lock.shield.fill")
          .resizable()
          .scaledToFit()
          .frame(width: 60, height: 60)
          .foregroundColor(.blue)
        Text("Secure Login")
          .font(.largeTitle)
          .fontWeight(.bold)
        Text("Welcome back! Please log in to continue.")
          .font(.subheadline)
          .foregroundColor(.secondary)
        Text("Use Admin 1234 to continue.")
          .font(.subheadline)
          .foregroundColor(.secondary)
      }
      .padding(.top, 60)
      .padding(.bottom, 40)

      VStack(spacing: 16) {
        HStack {
          Image(systemName: "person.fill")
            .foregroundColor(.gray)
          TextField("Username", text: $viewModel.username)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)

        HStack {
          Image(systemName: "lock.fill")
            .foregroundColor(.gray)
          SecureField("Password", text: $viewModel.password)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)

        if let error = viewModel.errorMessage {
          Text(error)
            .foregroundColor(.red)
            .font(.caption)
            .multilineTextAlignment(.center)
            .padding(.top, 4)
        }
      }
      .padding(.horizontal)

      Button(
        action: {
          viewModel.login()
        },
        label: {
          Text("Log In")
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        },
      )
      .padding(.horizontal)
      .padding(.top, 20)

      Spacer()

      Text("© 2025 YourCompany Inc.")
        .font(.footnote)
        .foregroundColor(.gray)
        .padding(.bottom, 16)
    }
    .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
  }
}
