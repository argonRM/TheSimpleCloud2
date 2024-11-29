//
//  TheSimpleCloud2App.swift
//  TheSimpleCloud2
//
//  Created by Roman Maiboroda on 24/11/2024.
//

import SwiftUI
import GoogleSignIn

@main
struct TheSimpleCloud2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onOpenURL { url in
                          GIDSignIn.sharedInstance.handle(url)
                        }
                .onAppear {
                          GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                            // Check if `user` exists; otherwise, do something with `error`
                              setupGoogle()
                          }
                        }
        }
    }
    
    func setupGoogle() {
        
        let clientID = "1024248679237-54lmurqjut46li6m0rikh809tbrd8p34.apps.googleusercontent.com"
        let config = GIDConfiguration(clientID: clientID)
                
        GIDSignIn.sharedInstance.configuration = config
    }
}
