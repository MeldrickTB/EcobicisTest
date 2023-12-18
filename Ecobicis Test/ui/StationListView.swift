//
//  StationListView.swift
//  Ecobicis Test
//
//  Created by Meldrick Trujeque on 16/12/23.
//

import SwiftUI

struct StationListView: View {
    
    @ObservedObject var viewModel: StationViewModel
    
    var body: some View {
        
        VStack{
            if let network = viewModel.network {
                List(network.stations.prefix(50).indices, id: \.self) { indice in
                    let station = network.stations[indice]
                    NavigationLink(destination: MapView(station: station, viewModel: viewModel)){
                        HStack {
                            Image(systemName: "bicycle")
                                .foregroundColor(.primary)
                            VStack(alignment: .leading) {
                                Text("\(indice+1). \(station.name)")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text("Bicicletas disponibles: \(station.freeBikes)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical)
                    }
                }
                .background(Color.white)
                .navigationTitle("\(network.name) \(network.location.country)")
                .listStyle(PlainListStyle())
                
                Spacer()
                
                Button(action: {
                    viewModel.signOut()
                }) {
                    HStack {
                        Image(systemName: "arrowshape.turn.up.left")
                            .foregroundColor(.white)
                        Text("Cerrar sesión")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(width: 220, height: 40)
                    .background(Color.red)
                    .cornerRadius(15.0)
                }
                .padding()
                .buttonStyle(PlainButtonStyle())
                
            } else {
                ProgressView("Cargando...")
            }
        }
        .onAppear(perform: viewModel.fetchNetworkData)
        .background(Color.white)
        .edgesIgnoringSafeArea(.trailing)
    }
}

