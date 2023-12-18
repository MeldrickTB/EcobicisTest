//
//  StationDetailView.swift
//  Ecobicis Test
//
//  Created by Meldrick Trujeque on 17/12/23.
//

import SwiftUI

struct StationDetailView: View {
    @State var station: Station
    @ObservedObject var viewModel: StationViewModel

    let onClose: () -> Void

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: onClose) {
                    Image(systemName: "xmark") // Icono de cerrar ventana
                        .foregroundColor(.black)
                        .padding()
                }
            }

            ScrollView {
                VStack(alignment: .center) {
                    Text(station.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .multilineTextAlignment(.center)

                    Group {
                        HStack {
                            Image(systemName: "bicycle") // Icono de bicicleta
                            Text("Bicicletas disponibles")
                                .font(.title2)
                                .foregroundColor(.secondary)
                        }
                        Text("\(station.freeBikes)")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .multilineTextAlignment(.center)

                    Group {
                        HStack {
                            Image(systemName: "square.grid.2x2") // Icono de cuadrícula
                            Text("Espacios vacíos")
                                .font(.title2)
                                .foregroundColor(.secondary)
                        }
                        Text("\(station.emptySlots)")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .multilineTextAlignment(.center)

                    Group {
                        HStack {
                            Image(systemName: "sum") // Icono de suma
                            Text("Total de espacios")
                                .font(.title2)
                                .foregroundColor(.secondary)
                        }
                        Text("\(station.freeBikes+station.emptySlots)")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .multilineTextAlignment(.center)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
        }
    }
}
