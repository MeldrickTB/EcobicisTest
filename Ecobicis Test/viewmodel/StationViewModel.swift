//
//  BiciViewmodel.swift
//  Ecobicis Test
//
//  Created by Meldrick Trujeque on 16/12/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

class StationViewModel: ObservableObject{
    
@Published var email: String = ""
@Published var signedIn = false
@Published var error = ""
@Published var network: Network?
private var currentPage = 1
private let pageSize = 50

    var authDidChangeListenerHandle: AuthStateDidChangeListenerHandle?

    init() {
        authDidChangeListenerHandle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                print("Bienvenido \(user.uid)")
                self.signedIn = true
            } else {
                self.signedIn = false
            }
        }
    }

    func signIn(email: String, password: String) {
        
        if(!email.isEmpty && !password.isEmpty){
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    print(error.localizedDescription)
                    self.error = "Ocurrió un error"
                } else {
                    self.signedIn = true
                    self.error = ""
                }
            }
        } else {
            if(password.isEmpty){
                self.error = "Debes ingresar una contraseña"
            }
            if(email.isEmpty){
                self.error = "Debes ingresar un correo"
            }
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.signedIn = false
        } catch let signOutError as NSError {
            self.error = "Ocurrió un error"
            print ("Error signing out: %@", signOutError)
        }
    }
    
    func signUp(email: String, password: String, confirmPassword: String) {
            if password == confirmPassword {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let error = error {
                        self.error = error.localizedDescription
                    } else {
                        self.error = ""
                        // El usuario se registre exitosamente.
                    }
                }
            } else {
                self.error = "Las contraseñas no coinciden."
            }
        }
    
    func fetchNetworkData() {
            guard let url = URL(string: "https://api.citybik.es/v2/networks/ecobici") else {
                print("URL inválida")
                return
            }

            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode(Root.self, from: data) {
                        DispatchQueue.main.async {
                            self.network = decodedResponse.network
                        }
                        return
                    }
                }
                print("Error al cargar los datos: \(error?.localizedDescription ?? "Error desconocido")")
            }

            task.resume()
        }
}
