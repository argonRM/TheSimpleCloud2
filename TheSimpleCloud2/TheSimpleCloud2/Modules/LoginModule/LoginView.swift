//
//  LoginView.swift
//  TheSimpleCloud2
//
//  Created by Roman Maiboroda on 24/11/2024.
//

import SwiftUI
import GoogleSignIn

struct LoginView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Перша кнопка
            Button(action: {
                handleSignInButton()
            }) {
                HStack {
                    Text("Sign in dropbox")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "square.and.arrow.down") // Замінити на іконку Dropbox
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 4, x: 0, y: 2)
            }
            
            // Текст Signed as
            HStack {
                Text("Signed as Roman Maiboroda")
                    .font(.subheadline)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "person.circle.fill") // Замінити на відповідну іконку
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
            .padding()
            
            // Друга кнопка
            Button(action: {
                print("Continue tapped")
            }) {
                Text("Continue with one account")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 4, x: 0, y: 2)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(
            ZStack {
                Image("sand")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
            }
        )
        
    }
    
    func handleSignInButton() {
        guard let rootViewController = getRootViewController() else {
            print("Failed to get root view controller")
            return
        }
        
        GIDSignIn.sharedInstance.signIn(
            withPresenting: rootViewController) { signInResult, error in
              guard let result = signInResult else {
                // Inspect error
                return
              }
              // If sign in succeeded, display the app's main content View.
            }
    }
    
    
    func getRootViewController() -> UIViewController? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return nil
        }
        return keyWindow.rootViewController
    }
}

#Preview {
    LoginView()
}
