//
//  LoginView.swift
//  Ecobicis Test
//
//  Created by Meldrick Trujeque on 16/12/23.
//

import SwiftUI

struct LoginOrSignUpView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isSignUp = false
    @ObservedObject var viewModel: StationViewModel

    var body: some View {
        VStack {
            Text(isSignUp ? "Registrarse" : "Iniciar sesión")
                .font(.system(size: 35, weight: .bold, design: .default))
                .padding(.bottom, 50)
            
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
            }
            .padding(.bottom, 20)
            
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.gray)
                SecureField("Contraseña", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
            }
            .padding(.bottom, 20)
            
            if isSignUp {
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.gray)
                    SecureField("Confirmar contraseña", text: $confirmPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5.0)
                }
                .padding(.bottom, 20)
            }
            
            Button(action: {
                if isSignUp {
                    viewModel.signUp(email: email, password: password, confirmPassword: confirmPassword)
                } else {
                    viewModel.signIn(email: email, password: password)
                }
            }) {
                HStack {
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundColor(.white)
                    Text(isSignUp ? "Registrarse" : "Iniciar sesión")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(width: 220, height: 40)
                .background(Color.blue)
                .cornerRadius(15.0)
            }
            
            Button(action: {
                isSignUp.toggle()
            }) {
                Text(isSignUp ? "¿Ya tienes una cuenta? Iniciar sesión" : "¿No tienes una cuenta? Registrarse")
                    .font(.caption)
                    .foregroundColor(.blue)
                    .padding()
            }
            
            if !viewModel.error.isEmpty {
                Text(viewModel.error)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }
}

