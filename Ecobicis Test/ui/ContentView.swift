//
//  ContentView.swift
//  Ecobicis Test
//
//  Created by Meldrick Trujeque on 16/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = StationViewModel()

    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                StationListView(viewModel: viewModel)
            } else {
                LoginOrSignUpView(viewModel: viewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
